include $(TOPDIR)/rules.mk

PKG_NAME:=nfd
PKG_VERSION:=0.6.6
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://gerrit.named-data.net/NFD
PKG_SOURCE_VERSION:=NFD-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

CONFIGURE_VARS:=CXX=$(TARGET_CXX) PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" $(MAKE_VARS)
CONFIGURE_CMD:=./waf
CONFIGURE_ARGS:=configure --debug --without-pch --prefix=/usr --sysconfdir=/etc --boost-includes="$(STAGING_DIR)/usr/include" --boost-libs="$(STAGING_DIR)/usr/lib"

define Build/Compile
	cd $(PKG_BUILD_DIR) && \
	./waf
endef

define Package/nfd
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=NFD
	DEPENDS:=+libndn-cxx +libpcap
endef

define Package/nfd/description
	NDN Forwarding Daemon
endef

define Package/nfd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/bin/nfd $(PKG_BUILD_DIR)/build/bin/nfdc $(1)/usr/bin
endef

define Package/ndn-autoconfig
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=ndn-autoconfig
	DEPENDS:=+libndn-cxx
endef

define Package/ndn-autoconfig/description
	NDN HUB discovery client and server
endef

define Package/ndn-autoconfig/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/bin/ndn-autoconfig $(PKG_BUILD_DIR)/build/bin/ndn-autoconfig-server $(1)/usr/bin
endef

define Package/nfd-status-http
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=NFD status page
	EXTRA_DEPENDS:=nfd, uhttpd
endef

define Package/nfd-status-http/description
	serve NFD status page at /cgi-bin/nfd-status
endef

define Package/nfd-status-http/install
	$(INSTALL_DIR) $(1)/www/cgi-bin
	$(INSTALL_BIN) ./files/nfd-status $(1)/www/cgi-bin
	$(INSTALL_DIR) $(1)/www/nfd-status-static
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/tools/nfd-status-http-server-files/* $(1)/www/nfd-status-static
endef

$(eval $(call BuildPackage,nfd))
$(eval $(call BuildPackage,ndn-autoconfig))
$(eval $(call BuildPackage,nfd-status-http))
