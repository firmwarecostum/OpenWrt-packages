include $(TOPDIR)/rules.mk

PKG_NAME:=infoedit
PKG_VERSION:=0.0.20171220
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/NDN-Routing/infoedit.git
PKG_SOURCE_VERSION:=5ef83615b5360da519de5bceecf602cdadebd298

include $(INCLUDE_DIR)/package.mk

CONFIGURE_VARS:=CXX=$(TARGET_CXX) PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" $(MAKE_VARS)
CONFIGURE_CMD:=./waf
CONFIGURE_ARGS:=configure --debug --without-pch --prefix=/usr --sysconfdir=/etc --boost-includes="$(STAGING_DIR)/usr/include" --boost-libs="$(STAGING_DIR)/usr/lib"

define Build/Compile
	cd $(PKG_BUILD_DIR) && \
	$(TARGET_CXX) $(TARGET_CXXFLAGS) $(EXTRA_CXXFLAGS) $(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS) $(TARGET_LDFLAGS) $(EXTRA_LDFLAGS) -o infoedit infoedit.cpp -lboost_program_options
endef

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
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/infoedit $(1)/usr/bin
endef

$(eval $(call BuildPackage,infoedit))
