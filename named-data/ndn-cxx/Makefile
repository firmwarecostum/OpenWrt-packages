include $(TOPDIR)/rules.mk

PKG_NAME:=ndn-cxx
PKG_VERSION:=0.7.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/named-data/ndn-cxx.git
PKG_SOURCE_VERSION:=bdfb53aa09be3b0095b5392c0c24bef23c291e2f
PKG_MIRROR_HASH:=5d813272e7df3d9e97e783f3c0b2fd1e694a4db693d46a2812ef88be65007b12

include $(INCLUDE_DIR)/package.mk

CONFIGURE_VARS:=CXX=$(TARGET_CXX) $(MAKE_VARS)
CONFIGURE_CMD:=./waf
CONFIGURE_ARGS:=configure --debug --without-pch --prefix=/usr --boost-includes="$(STAGING_DIR)/usr/include" --boost-libs="$(STAGING_DIR)/usr/lib" --with-openssl="$(STAGING_DIR)/usr" --with-sqlite3="$(STAGING_DIR)/usr"

define Build/Compile
	cd $(PKG_BUILD_DIR) && \
	./waf
endef

define Build/InstallDev
	cd $(PKG_BUILD_DIR) && \
	./waf install --destdir=$(1)
endef

define Package/libndn-cxx
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=ndn-cxx
	DEPENDS:=+boost +boost-chrono +boost-date_time +boost-filesystem +boost-log +boost-program_options +boost-system +boost-thread +libatomic +libopenssl +libsqlite3
	ABI_VERSION:=$(PKG_VERSION)
endef

define Package/libndn-cxx/description
	NDN C++ library with eXperimental eXtensions
endef

define Package/libndn-cxx/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/build/libndn-cxx.so.* $(1)/usr/lib
endef

define Package/ndnsec
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=ndnsec
	DEPENDS:=+libndn-cxx
endef

define Package/ndnsec/description
	NDN security management toolkit
endef

define Package/ndnsec/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/bin/ndnsec* $(1)/usr/bin
endef

$(eval $(call BuildPackage,libndn-cxx))
$(eval $(call BuildPackage,ndnsec))
