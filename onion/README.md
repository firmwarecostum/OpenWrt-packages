# yoursunny OpenWrt Packages for Onion

These are my OpenWrt packages specifically for [Onion Omega2 Pro](https://onion.io/store/omega2-pro/) device.
This assumes the device has been [flashed with OpenWrt 18.06](https://yoursunny.com/t/2019/omega2pro-openwrt/) instead of Onion OS.

Compilation requires adding [Onion Packages](https://github.com/OnionIoT/OpenWRT-Packages/) feed to `feeds.conf`:

    src-git onion https://github.com/OnionIoT/OpenWRT-Packages.git

## Available Packages

**luci-powerdock2** (menu: LuCI - Onion) displays [battery voltage on LuCI homepage](https://yoursunny.com/t/2019/omega2pro-battery/).
