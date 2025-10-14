DEPEND_TARGETS += libmit.recursive
ECHO_TARGETS += libmit.echo
libmit.recursive:
	@echo SUPER_MAKE_DIR=/Users/lidali/alpine/applications/mit/               >> /Users/lidali/alpine/libraries/libmit/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/Users/lidali/alpine/applications/mit/.make >> /Users/lidali/alpine/libraries/libmit/.make/super
	cd /Users/lidali/alpine/libraries/libmit/ && /Applications/Xcode.app/Contents/Developer/usr/bin/make recursive && /Applications/Xcode.app/Contents/Developer/usr/bin/make install
	-rm /Users/lidali/alpine/libraries/libmit/.make/super
libmit.echo:
	@echo SUPER_MAKE_DIR=/Users/lidali/alpine/applications/mit/               >> /Users/lidali/alpine/libraries/libmit/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/Users/lidali/alpine/applications/mit/.make >> /Users/lidali/alpine/libraries/libmit/.make/super
	cd /Users/lidali/alpine/libraries/libmit/ && /Applications/Xcode.app/Contents/Developer/usr/bin/make echo
	-rm /Users/lidali/alpine/libraries/libmit/.make/super
