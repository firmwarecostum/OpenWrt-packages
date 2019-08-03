include $(TOPDIR)/rules.mk

PKG_NAME:=nfd
PKG_VERSION:=0.6.6
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://gerrit.named-data.net/NFD
PKG_SOURCE_VERSION:=$(PKG_NAME)-$(PKG_VERSION)

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

$(eval $(call BuildPackage,nfd))
$(eval $(call BuildPackage,ndn-autoconfig))
