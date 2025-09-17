DEPEND_TARGETS += libmit.recursive
ECHO_TARGETS += libmit.echo
libmit.recursive:
	@echo SUPER_MAKE_DIR=/volumes/llama/home/alpine/applications/mit/               >> /volumes/llama/home/alpine/libraries/libmit/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/volumes/llama/home/alpine/applications/mit/.make >> /volumes/llama/home/alpine/libraries/libmit/.make/super
	cd /volumes/llama/home/alpine/libraries/libmit/ && make recursive && make install
	-rm /volumes/llama/home/alpine/libraries/libmit/.make/super
libmit.echo:
	@echo SUPER_MAKE_DIR=/volumes/llama/home/alpine/applications/mit/               >> /volumes/llama/home/alpine/libraries/libmit/.make/super
	@echo SUPER_MAKE_CONFIG_DIR=/volumes/llama/home/alpine/applications/mit/.make >> /volumes/llama/home/alpine/libraries/libmit/.make/super
	cd /volumes/llama/home/alpine/libraries/libmit/ && make echo
	-rm /volumes/llama/home/alpine/libraries/libmit/.make/super
