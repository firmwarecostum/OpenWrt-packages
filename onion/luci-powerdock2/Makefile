include $(TOPDIR)/rules.mk

PKG_NAME:=luci-powerdock2
PKG_VERSION:=0.0.20190724
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Build/Compile
endef

define Package/luci-powerdock2
	SECTION:=onion
	CATEGORY:=LuCI
	SUBMENU:=Onion
	TITLE:=luci-powerdock2
	DEPENDS:=@TARGET_ramips_mt76x8_DEVICE_omega2p
	EXTRA_DEPENDS:=i2c-tools, kmod-i2c-mt7628, luci-mod-admin-full, power-dock2
endef

define Package/luci-powerdock2/description
	Display battery level on LuCI
endef

define Package/luci-powerdock2/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/admin_status/index
	$(INSTALL_DATA) ./files/powerdock2.htm $(1)/usr/lib/lua/luci/view/admin_status/index
endef

$(eval $(call BuildPackage,luci-powerdock2))
