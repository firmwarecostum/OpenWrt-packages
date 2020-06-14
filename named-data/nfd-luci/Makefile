include $(TOPDIR)/rules.mk

PKG_NAME:=nfd-luci
PKG_VERSION:=0.0.20190908
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/9th-ndn-hackathon/NFD-LuCI.git
PKG_SOURCE_VERSION:=c02b730ce9b340f5a69ade67ab1a5ffc709e36be

include $(INCLUDE_DIR)/package.mk

define Build/Compile
endef

define Package/nfd-luci
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=NDN LuCI Integration
	EXTRA_DEPENDS:=luci-compat, luci-lib-json, nfd-service, nfd-status-http
	PKGARCH:=all
endef

define Package/nfd-luci/description
	NDN config and status pages in LuCI
endef

define Package/nfd-luci/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	cp -R $(PKG_BUILD_DIR)/luci $(1)/usr/lib/lua/
endef

$(eval $(call BuildPackage,nfd-luci))
