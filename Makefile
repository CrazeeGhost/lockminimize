ARCHS = armv7 arm64

THEOS_DEVICE_IP = 10.0.200.110

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LockMinimize
LockMinimize_FILES = Tweak.xm

LockMinimize_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"


