include $(TOPDIR)/rules.mk

PKG_NAME:=ndn-tools
PKG_VERSION:=0.7.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/named-data/ndn-tools.git
PKG_SOURCE_VERSION:=374f4e47b57bc41b4fca4887518c39f5c165cdaa

include $(INCLUDE_DIR)/package.mk

CONFIGURE_VARS:=CXX=$(TARGET_CXX) PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" $(MAKE_VARS)
CONFIGURE_CMD:=./waf
CONFIGURE_ARGS:=configure --debug --prefix=/usr --boost-includes="$(STAGING_DIR)/usr/include" --boost-libs="$(STAGING_DIR)/usr/lib" --enable-ping --enable-peek --enable-chunks --enable-dissect

define Build/Compile
	cd $(PKG_BUILD_DIR) && \
	./waf
endef

define Package/ndnping
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=ndnping
	DEPENDS:=+libndn-cxx
endef

define Package/ndnping/description
	NDN reachability testing tool
endef

define Package/ndnping/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/bin/ndnping $(PKG_BUILD_DIR)/build/bin/ndnpingserver $(1)/usr/bin
endef

define Package/ndnpeek
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=ndnpeek & ndnpoke
	DEPENDS:=+libndn-cxx
endef

define Package/ndnpeek/description
	request and serve a single Data packet
endef

define Package/ndnpeek/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/bin/ndnpeek $(PKG_BUILD_DIR)/build/bin/ndnpoke $(1)/usr/bin
endef

define Package/ndn-chunks
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=ndncatchunks & ndnputchunks
	DEPENDS:=+libndn-cxx
endef

define Package/ndn-chunks/description
	transfer a file as Data segments
endef

define Package/ndn-chunks/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/bin/ndncatchunks $(PKG_BUILD_DIR)/build/bin/ndnputchunks $(1)/usr/bin
endef

define Package/ndn-dissect
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=ndn-dissect
	DEPENDS:=+libndn-cxx
endef

define Package/ndn-dissect/description
	NDN packet format inspector
endef

define Package/ndn-dissect/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/bin/ndn-dissect $(1)/usr/bin
endef

$(eval $(call BuildPackage,ndnping))
$(eval $(call BuildPackage,ndnpeek))
$(eval $(call BuildPackage,ndn-chunks))
$(eval $(call BuildPackage,ndn-dissect))
