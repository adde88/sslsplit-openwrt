PKG_NAME:=sslsplit
PKG_VERSION:=0.5.5
PKG_RELEASE:=1

PKG_BUILD_DEPENDS:=libnet-1.2.x

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/package.mk

define Package/sslsplit
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Transparent SSL/TLS interception
  DEPENDS:=+libopenssl +libevent2 +libevent2-openssl +libevent2-pthreads +libopenssl +libpthread +musl-fts +libpcap +libnet-1.2.x
endef

define Package/sslsplit/description
	SSLsplit is a tool for man-in-the-middle attacks against SSL/TLS encrypted network connections.
	It is intended to be useful for network forensics, application security analysis and penetration testing.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src $(PKG_BUILD_DIR)/
endef

LIBS='-lfts'
MAKE_PATH:=src

#TARGET_LDLAGS += -lfts

define Package/sslsplit/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/sslsplit $(1)/usr/bin/
endef

$(eval $(call BuildPackage,sslsplit))
