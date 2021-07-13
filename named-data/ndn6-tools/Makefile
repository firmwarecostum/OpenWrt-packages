include $(TOPDIR)/rules.mk

PKG_NAME:=ndn6-tools
PKG_VERSION:=0.0.20210627
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/yoursunny/ndn6-tools.git
PKG_SOURCE_VERSION:=bb5a43866beb5e8f233e57cde30d8632b10162c6
PKG_MIRROR_HASH:=c059cd5ed5e2607b4678863d5384f8bcdecfa66d04b84cd7585dc61005c5fa42

include $(INCLUDE_DIR)/package.mk

MAKE_VARS+=PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"

define Package/ndn6-file-server
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=ndn6-file-server
	DEPENDS:=+libndn-cxx
endef

define Package/ndn6-file-server/description
	serve file from filesystem
endef

define Package/ndn6-file-server/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/file-server $(1)/usr/bin/ndn6-file-server
endef

define Package/ndn6-prefix-proxy
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=ndn6-prefix-proxy
	DEPENDS:=+libndn-cxx
endef

define Package/ndn6-prefix-proxy/description
	handle prefix registration command with prefix confinement
endef

define Package/ndn6-prefix-proxy/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/prefix-proxy $(1)/usr/bin/ndn6-prefix-proxy
endef

define Package/ndn6-register-prefix-cmd
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=ndn6-register-prefix-cmd
	DEPENDS:=+libndn-cxx
endef

define Package/ndn6-register-prefix-cmd/description
	prepare a prefix registration command
endef

define Package/ndn6-register-prefix-cmd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/register-prefix-cmd $(1)/usr/bin/ndn6-register-prefix-cmd
endef

define Package/ndn6-serve-certs
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=ndn6-serve-certs
	DEPENDS:=+libndn-cxx
endef

define Package/ndn6-serve-certs/description
	serve certificates
endef

define Package/ndn6-serve-certs/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/serve-certs $(1)/usr/bin/ndn6-serve-certs
endef

define Package/ndn6-unix-time-service
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=ndn6-unix-time-service
	DEPENDS:=+libndn-cxx
endef

define Package/ndn6-unix-time-service/description
	answer queries of current Unix timestamp
endef

define Package/ndn6-unix-time-service/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/unix-time-service $(1)/usr/bin/ndn6-unix-time-service
endef

$(eval $(call BuildPackage,ndn6-file-server))
$(eval $(call BuildPackage,ndn6-prefix-proxy))
$(eval $(call BuildPackage,ndn6-register-prefix-cmd))
$(eval $(call BuildPackage,ndn6-serve-certs))
$(eval $(call BuildPackage,ndn6-unix-time-service))
