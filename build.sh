#!/bin/bash
# (pushd/popd needs an advanced shell)

set -e

SCRIPTDIR=$(dirname $0)

print_usage() {
    echo "Usage: $0 [GLUON_BRANCH] [GLUON RELEASE] [subnumber]"
    echo ''
    echo 'If GLUON_BRANCH is not given, experimental is set.'
    echo ''
    echo 'Options:'
    echo '  -d  dirclean'
    echo '  -h  show this help'
    echo '  -v  verbose mode'
    echo '  -y  answer all questions with yes'
}

# command line options handling
ALLYES='false'
ARGS=$(getopt dhvy $*)
if [ $? -ne 0 ]
then
    print_usage
    exit 2
fi
set -- $ARGS

while true
do
    case "$1" in
        -d)
            DIRCLEAN='true'
            shift
            ;;
        -h)
            print_usage
            exit 0
            ;;
        -v)
            VERBOSE='V=s'
            shift
            ;;
        -y)
            ALLYES='true'
            shift
            ;;
        --)
            shift; break;;
    esac
done

# set GLUON_BRANCH for manifest
if [ -z "$1" ]
then
    GLUON_BRANCH=experimental
    BROKEN=1
    echo 'Set GLUON_BRANCH to "experimental"!'
else
    GLUON_BRANCH=$1
fi

if [ -n "$2" ]
then
	GLUON_CHECKOUT=v$2
	NUM="${3:-1}"
	GLUON_RELEASE="${GLUON_CHECKOUT:1}-$NUM-$GLUON_BRANCH"
	SITE_CHECKOUT="$GLUON_CHECKOUT-$NUM-${GLUON_BRANCH:0:1}"
fi

case "xx$GLUON_BRANCH" in
    'xxstable')
        # one week
        GLUON_PRIORITY=7
	BROKEN=0
        ;;
    'xxbeta')
        # three days
        GLUON_PRIORITY=3
	BROKEN=1
        ;;
    'xxexperimental')
        # use default GLUON_PRIORITY set in site.mk
        ;;
    *)
        echo "Unknown GLUON_BRANCH '$1'."
        echo 'Use "stable", "beta", or "experimental"!'
        exit 1
        ;;
esac

export GLUON_BRANCH GLUON_PRIORITY

# get GLUON_CHECKOUT from site dir
pushd ${SCRIPTDIR}
eval $(make -s -f helper.mk)

GLUON_CHECKOUT="${GLUON_CHECKOUT:-$DEFAULT_GLUON_CHECKOUT}"
GLUON_RELEASE="${GLUON_RELEASE:-$DEFAULT_GLUON_RELEASE}"

# Begin Logfiles
{

echo -e "GLUON_CHECKOUT: \033[32m${GLUON_CHECKOUT}\033[0m"
echo -e "GLUON_BRANCH: \033[32m${GLUON_BRANCH}\033[0m"
echo -e "GLUON_RELEASE: \033[32m${GLUON_RELEASE}\033[0m"
echo -e "SITE_CHECKOUT: \033[32m${SITE_CHECKOUT}\033[0m"

# wait to give user time to read the things above
for i in $(seq 3)
do
    sleep 1
    echo -n '.'
done
sleep 1
echo

# goto gluon dir
pushd ..

cd site
git checkout lede
git pull
git checkout ${SITE_CHECKOUT}
cd ..

# ask if old images should be removed
echo -n 'Cleanup old image directory? (y/N) '
if [ "${ALLYES}" = 'true' ]
then
    ANSWER='y'
    echo ${ANSWER}
else
    read ANSWER
fi
if [ "${ANSWER}" = 'y' ]
then
    rm -vrf output/images/factory output/images/sysupgrade
fi

# gather some information about current build tree before clean
OLD_OPENWRT_RELEASE=$(grep 'RELEASE:=' include/toplevel.mk | sed -e 's/RELEASE:=//')
OLD_TARGETS=$(make 2>/dev/null | grep '^ [*] ' | cut -d' ' -f3)

# prepare gluon tree
echo -e "\033[32mPreparing gluon build ...\033[0m"
if [ "${DIRCLEAN}" = 'true' ]
then
    echo -e "\033[32mMaking dirclean ...\033[0m"
    make dirclean
else
    for target in ${OLD_TARGETS}
    do
        echo -e "\033[32mCleaning old target ${target} ...\033[0m"
        make clean GLUON_TARGET=${target} $VERBOSE
    done
fi

git checkout master
git pull
git checkout ${GLUON_CHECKOUT}

NEW_TARGETS=$(make 2>/dev/null | grep '^ [*] ' | cut -d' ' -f3)
for target in ${NEW_TARGETS}
do
    make clean GLUON_TARGET=${target} $VERBOSE
done

make update $VERBOSE

# loop through all targets and build them
for target in ${NEW_TARGETS}
do
    echo -e "Starting to build target \033[32m${target}\033[0m ..."
    make GLUON_TARGET=${target} -j20 BROKEN=$BROKEN GLUON_RELEASE=$GLUON_RELEASE $VERBOSE
done

# finalize
echo -e "\033[32mMaking manifest ...\033[0m"
make manifest $VERBOSE

# ..
popd

# ${SCRIPTDIR}
popd

exit 0

} > >(tee -a /var/log/firmware-build/$GLUON_RELEASE.log) 2> >(tee -a /var/log/firmware-build/$GLUON_RELEASE.error.log | tee -a /var/log/firmware-build/$GLUON_RELEASE.log >&2)

# vim: set et sts=0 ts=4 sw=4 sr:
