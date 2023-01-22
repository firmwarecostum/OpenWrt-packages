# yoursunny OpenWrt Packages

These are my OpenWrt packages.
I use them with [Onion Omega2 Pro](https://onion.io/store/omega2-pro/) device.

Categories:

* [named-data](named-data/): Named Data Networking software
* [onion](onion/): packages specifically for Onion Omega2 Pro device

## Installation

1. Install [OpenWrt build system](https://openwrt.org/docs/guide-developer/build-system/install-buildsystem), branch `openwrt-22.03`.

2. Copy `feeds.conf.default` to `feeds.conf`, and append the following:

   ```tsv
   src-git yoursunny https://github.com/yoursunny/OpenWrt-packages.git
   ```

   Alternatively, if this repository has been cloned locally, use something like (must be absolute path):

   ```tsv
   src-link yoursunny /path/to/yoursunny/OpenWrt-packages
   ```

   This enables OpenWrt build system to find my packages.

   If you switched branches in the main OpenWrt repository, be sure to delete and re-create `feeds.conf` file so that they point to the correct branch.

3. Update feeds and enable my packages:

   ```bash
   ./scripts/feeds update -a
   ./scripts/feeds install -a
   ```

   If I have published or updated a package, run the following commands to pull the latest changes:

   ```bash
   ./scripts/feeds update -a
   ./scripts/feeds install -a -p yoursunny
   ```

4. Have a look at the README in category or package directory, which may contain additional instructions.

5. Select packages to compile:

   ```bash
   make menuconfig
   ```

   First choose the correct target system according to your device.
   Then, find the package you need in the menu, and press `M` key to mark `<M>` for compiling as a `.ipk` module.

   If it's your first time building for a target system, install the toolchain for this architecture:

   ```bash
   make toolchain/install
   ```

6. Compile a package:

   ```bash
   make V=sc package/PKGNAME/compile
   ```

   Substitute `PKGNAME` with a package name in this repository.

   If successful, the result should be in `bin/packages/ARCH/yoursunny/*.ipk`.

7. Copy `.ipk` files to the device, and install them with [opkg](https://openwrt.org/docs/guide-user/additional-software/opkg).

   ```bash
   opkg update
   opkg install *.ipk
   ```
