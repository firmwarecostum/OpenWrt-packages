include $(TOPDIR)/rules.mk

PKG_NAME:=ndn6-tools
PKG_VERSION:=0.0.20220314
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/yoursunny/ndn6-tools.git
PKG_SOURCE_VERSION:=f7daa1ee05db17114514792b0875d59a4aab8e54
PKG_MIRROR_HASH:=c7a168003669024830abecf9dd756ee1c4ded6e8469a06938975330ce6d44238

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

define Package/ndn6-register-prefix-remote
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Named Data Networking
	TITLE:=ndn6-register-prefix-remote
	DEPENDS:=+libndn-cxx
endef

define Package/ndn6-register-prefix-remote/description
	send prefix registration commands to a specified remote face
endef

define Package/ndn6-register-prefix-remote/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/register-prefix-remote $(1)/usr/bin/ndn6-register-prefix-remote
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
$(eval $(call BuildPackage,ndn6-register-prefix-remote))
$(eval $(call BuildPackage,ndn6-serve-certs))
$(eval $(call BuildPackage,ndn6-unix-time-service))
