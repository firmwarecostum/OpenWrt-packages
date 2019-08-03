# yoursunny OpenWrt packages

These are my OpenWrt packages.
I use them with [Onion Omega2 Pro](https://onion.io/store/omega2-pro/) device.

## Installation

1.  Install [OpenWrt build system](https://openwrt.org/docs/guide-developer/build-system/install-buildsystem), branch `openwrt-18.06`.

2.  Create `feeds.conf` in OpenWrt directory, and paste the following:

        src-git yoursunny https://github.com/yoursunny/OpenWrt-packages.git

    This enables OpenWrt build system to find my packages.

3.  Update feeds and enable my packages:

        ./scripts/feeds update -a
        ./scripts/feeds install -a -p yoursunny

    If I have published or updated a package, you'll need to repeat this step to pull my changes.

4.  Select packages to compile:

        make menuconfig

    First choose the correct target system according to your device.
    Then, find the package you need in the menu, and press `M` key to mark `<M>` for compiling as a `.ipk` module.

5.  Compile a package:

        make V=sc package/PKGNAME/compile

    Substitute `PKGNAME` with a package name in this repository.

    If successful, the result should be in `bin/packages/ARCH/yoursunny/*.ipk`.

6.  Copy `.ipk` files to the device, and install them with [opkg](https://openwrt.org/docs/guide-user/additional-software/opkg).
