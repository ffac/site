features {
    'autoupdater',
    'ebtables-filter-multicast',
    'ebtables-filter-ra-dhcp',
    'ebtables-limit-arp',
    'mesh-batman-adv-15',
    'mesh-vpn-wireguard',
    'respondd',
    'status-page',
    'web-advanced',
    'web-wizard',
    'radv-filterd',
    'radvd',
    'web-private-wifi',
}

packages {
    'iwinfo',
    'ffac-wg-registration',
    'respondd-module-airtime',
    'tecff-general-workaround',
}
include('gluon-build/contrib/image-customization-helper.lua')

-- only add if not tiny and at more than 64MB RAM
if not device_class('tiny') and not atmost_64mb_ram then
    features {
        'tls',
        'wireless-encryption-wpa3',
        'web-logging',
        'config-mode-geo-location-osm',
    }
    packages {
        'openssh-sftp-server',
        'ffac-autoupdater-wifi-fallback',
        'ffmuc-custom-banner',
        'ffac-ssid-changer',
        'ff-web-ap-timer',
        'ffda-gluon-usteer',
        'ffda-node-whisperer',
    }
end


-- include packages only if any wifi is available
if not (no_wifi24 and no_wifi50) then
    packages {
        'ff-web-ap-timer',
        'ffac-ssid-changer',
        'tecff-broken-wlan-workaround',
    }
end

if has_lte then
    features {
        'web-cellular',
    }
    packages {
        'ffac-web-private-wan-dhcp',
    }
end

-- rtl838x has no USB support as of Gluon v2023.2
if has_usb or target('x86', '64') then
    -- add usb packages
    include('image-customization-usb.lua')

    packages {'ffka-gluon-web-usb-wan-hotplug', 'ffac-update-location-gps'}
end

-- device has no reset button and requires a special package to go into setup mode
-- https://github.com/freifunk-gluon/community-packages/tree/master/ffda-network-setup-mode
if device({
    'zyxel-nwa55axe',
}) then
    packages {'ffda-network-setup-mode'}
    broken(false)
end

if device({
    'avm-fritz-box-7530',
}) then
    packages {'ffac-web-dsl'}
end

if target('x86', '64') then
    -- add guest agent for qemu and vmware
    packages {
        'qemu-ga',
        'open-vm-tools',
    }
end

if target('x86') and not target('x86', 'legacy') then
    packages(pkgs_pci)
    packages(pkgs_hid)
end

if target('bcm27xx') then
    packages(pkgs_hid)
end

if device({
    'acer-vero-w6m',
}) then
	-- add SAE support to w6m, as 6GHz requires the package
	packages {
        'gluon-mesh-wireless-sae',
	}
end
