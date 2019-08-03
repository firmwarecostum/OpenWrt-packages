# yoursunny OpenWrt Packages of Named Data Networking

These are my OpenWrt packages of [Named Data Networking](https://named-data.net/) software.
They appear in `make menuconfig` at: Network - Named Data Networking.

Compiled binaries are several megabytes large.
They are unlikely to work on devices with small RAM and flash storage.
128MB memory device and [extroot](https://openwrt.org/docs/guide-user/additional-software/extroot_configuration) are highly recommended.

## Available Packages

**Binary packages** are compiled from C++ source code.
They come without configuration or service registration.

* libndn-cxx
* ndnsec
* nfd
* ndn-autoconfig
* ndnping
* ndnpeek
* ndn-chunks
* ndn-dissect
* infoedit
* ndn6-file-server
* ndn6-register-prefix-cmd
* ndn6-serve-certs

**Script packages** provide configuration and scripts.
They allow running binaries as services, configured via [the UCI system](https://openwrt.org/docs/guide-user/base-system/uci).

* nfd-status-http

**LuCI packages** integrate NDN software with [LuCI web interface](https://openwrt.org/docs/techref/luci).

* (none at this time)
