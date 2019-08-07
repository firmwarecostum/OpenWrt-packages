include $(TOPDIR)/rules.mk

PKG_NAME:=nfd-service
PKG_VERSION:=0.0.20190806
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Build/Compile
endef

define Package/nfd-service
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=NFD system service
	EXTRA_DEPENDS:=infoedit libuci-lua luci-base ndn-autoconfig nfd
	PKGARCH:=all
endef

define Package/nfd-service/description
	Run NFD as a system service
endef

define Package/nfd-service/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/nfd.service $(1)/etc/init.d/nfd
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DATA) ./files/nfd.uci-defaults $(1)/etc/uci-defaults/51-nfd
	$(INSTALL_DIR) $(1)/usr/lib/lua/named-data
	$(INSTALL_DATA) ./files/nfd-init.lua $(1)/usr/lib/lua/named-data/nfd-init.lua
endef

$(eval $(call BuildPackage,nfd-service))
