include $(TOPDIR)/rules.mk

PKG_NAME:=infoedit
PKG_VERSION:=0.0.20210127
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/NDN-Routing/infoedit.git
PKG_SOURCE_VERSION:=3226bdce4a225328df177840280f76ec81091176
PKG_MIRROR_HASH:=381b78b2f7afc025ccb53ef55b8890d6c5745e3905c83dc8bd7e7fef206e7c77

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
