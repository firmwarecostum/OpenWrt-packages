include $(TOPDIR)/rules.mk

PKG_NAME:=infoedit
PKG_VERSION:=0.0.20200617
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/NDN-Routing/infoedit.git
PKG_SOURCE_VERSION:=5e88552933fc45a9beef8d459cfa984e47689f13

include $(INCLUDE_DIR)/package.mk

define Package/infoedit
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=infoedit
	DEPENDS:=+boost +boost-program_options
endef

define Package/infoedit/description
	A tool used to edit NFD configuration files
endef

define Package/infoedit/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/infoconv $(PKG_BUILD_DIR)/infoedit $(1)/usr/bin
endef

$(eval $(call BuildPackage,infoedit))
