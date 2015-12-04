include theos/makefiles/common.mk
export ARCHS = armv7 armv7s arm64
export TARGET = iphone:clang:7.0:7.0
TWEAK_NAME = ZKXYHB2V2G
ZKXYHB2V2G_FILES = Tweak.xm CompileDefines.xm Hooks/SDKSpecific/AdView.xm Hooks/SDKSpecific/AdViewVideoDelegate.mm Hooks/SDKSpecific/Domob.xm Hooks/SDKSpecific/GoogleAdMob.xm Hooks/SDKSpecific/InMobi.xm Hooks/APIHooks/NSURLConnection.xm Hooks/AdWall/DomobAdwall.xm Hooks/AdWall/TapJoy.xm Hooks/Utils.m
ADDITIONAL_CCFLAGS  = -Qunused-arguments
ADDITIONAL_LDFLAGS  = -Wl,-segalign,4000
include $(THEOS_MAKE_PATH)/tweak.mk
after-install::
	install.exec "killall -9 SpringBoard"