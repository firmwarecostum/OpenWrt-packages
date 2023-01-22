include $(TOPDIR)/rules.mk

PKG_NAME:=infoedit
PKG_VERSION:=0.0.20221229
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/NDN-Routing/infoedit.git
PKG_SOURCE_VERSION:=cecfe583f5d2df974f5cbd50996f91b9d321be99
PKG_MIRROR_HASH:=0939c3e9708f34c8a14c31a913143ada30cfdd220fcd00dc246bc2008f630a11

include $(INCLUDE_DIR)/package.mk

define Package/infoedit
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=infoedit
	DEPENDS:=+boost +boost-program_options
endef

define Package/infoedit/description
	Command Line Tools for Boost INFO Format
endef

define Package/infoedit/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/infoconv $(PKG_BUILD_DIR)/infoedit $(1)/usr/bin
endef

$(eval $(call BuildPackage,infoedit))
