<<<<<<< HEAD
CC=g++
AS=as
AR=ar
LD=ld

# Learn something from /lib/modules/6.1.29-0-lts/build/Makefile

define add_module
endef

define del_module
endef

define config
endef
=======
.DEFAULT_GOAL := ALL
MAKE_FILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MAKE_FILE_DIR  := $(dir $(MAKE_FILE_PATH))
MAKE_CONFIG_DIR           = $(MAKE_FILE_DIR).make
PROJECT_MODULE_MAKEFILES += $(wildcard $(MAKE_CONFIG_DIR)/*.mk)
include $(PROJECT_MODULE_MAKEFILES)
include $(MAKE_CONFIG_DIR)/config
ifneq ($(wildcard $(MAKE_CONFIG_DIR)/super),)
include $(MAKE_CONFIG_DIR)/super
endif
include $(MAKE_CONFIG_DIR)/target
>>>>>>> 40f4c7b (Sun Aug 17 22:46:09 CST 2025)

PLATFORM_ARCH         = $(shell uname -s)
PLATFORM_ARCH_LINUX   = Linux
PLATFORM_ARCH_DARWIN  = Darwin
PLATFORM_ARCH_FREEBSD = FreeBSD

# ** Project Settings **
#
#    Output Name
#    TARGET_NAME     =  : Defined in .make/name and also can be redefine here.
#    Output Name Extensions
TARGET_BIN_EXT = 
TARGET_LIB_EXT_STATIC  =
TARGET_LIB_EXT_DYNAMIC = 
<<<<<<< HEAD
#    安装位置
INSTALL_PATH_PREFIX = /Applications/mit
TARGET_VERSION = 1.0.0
#INSTALL_PATH_PREFIX = /usr/local
=======
# Flags
ASFLAGS += ${TARGET_FLAGS_AS}
CCFLAGS += ${TARGET_FLAGS_CC} -c -fPIC -Wall -std=c11
PPFLAGS += ${TARGET_FLAGS_PP} -c -fPIC -Wall -std=c++11 -fvisibility=hidden
ARFLAGS += ${TARGET_FLAGS_AR}
LDFLAGS += ${TARGET_FLAGS_LD}

# Path where headers to be installed.
ifdef ROOT_HEADER_INSTALL_PATH
    HEADER_INSTALL_PATH = ${ROOT_HEADER_INSTALL_PATH}
    CCFLAGS += -I${ROOT_HEADER_INSTALL_PATH}
    PPFLAGS += -I${ROOT_HEADER_INSTALL_PATH}
endif

# Path where outputed binary to be installed.
ifdef ROOT_BINARY_INSTALL_PATH
    BINARY_INSTALL_PATH  = ${ROOT_BINARY_INSTALL_PATH}
endif

# Path where outputed library to be installed.
ifdef ROOT_LIBRARY_INSTALL_PATH
    LIBRARY_INSTALL_PATH  = ${ROOT_LIBRARY_INSTALL_PATH}
	LDFLAGS += -L${ROOT_LIBRARY_INSTALL_PATH}
    LDFLAGS += -Wl,-rpath=${ROOT_LIBRARY_INSTALL_PATH}
endif

# Path where aplications depended by this project to be downloaded.
ifdef ROOT_DEPENDS_APPLICATION_PATH
    DEPENDS_APPLICATION_PATH  = ${ROOT_DEPENDS_APPLICATION_PATH}
endif

# Path where libraries depended by this project to be downloaded.
ifdef ROOT_DEPENDS_LIBRARY_PATH
    DEPENDS_LIBRARY_PATH  = ${ROOT_DEPENDS_LIBRARY_PATH}
endif

# Path where third-parties depended by this project to be downloaded.
ifdef ROOT_DEPENDS_THIRDS_PATH
    DEPENDS_THIRDS_PATH  = ${ROOT_DEPENDS_THIRDS_PATH}
endif

ifndef ROOT_HEADER_INSTALL_PATH
export ROOT_HEADER_INSTALL_PATH  = ${HEADER_INSTALL_PATH}
endif
ifndef ROOT_BINARY_INSTALL_PATH
export ROOT_BINARY_INSTALL_PATH  = ${BINARY_INSTALL_PATH}
endif
ifndef ROOT_LIBRARY_INSTALL_PATH
export ROOT_LIBRARY_INSTALL_PATH = ${LIBRARY_INSTALL_PATH}
endif
ifndef ROOT_DEPENDS_APPLICATION_PATH
export ROOT_DEPENDS_APPLICATION_PATH = ${DEPENDS_APPLICATION_PATH}
endif
ifndef ROOT_DEPENDS_LIBRARY_PATH
export ROOT_DEPENDS_LIBRARY_PATH = ${DEPENDS_LIBRARY_PATH}
endif
ifndef ROOT_DEPENDS_THIRDS_PATH
export ROOT_DEPENDS_THIRDS_PATH  = ${DEPENDS_THIRDS_PATH}
endif

include $(MAKE_CONFIG_DIR)/prepare
include $(MAKE_CONFIG_DIR)/install

ifdef ROOT_INCLUDE_PATH
    CCFLAGS += -I${ROOT_INCLUDE_PATH}
	PPFLAGS += -I${ROOT_INCLUDE_PATH}
endif
ifdef ROOT_LIBRARY_PATH
    LDFLAGS += -L${ROOT_LIBRARY_PATH}
endif
ifdef ROOT_RUNTIME_PATH
    LDFLAGS += -Wl,-rpath=${ROOT_RUNTIME_PATH}
endif
>>>>>>> 40f4c7b (Sun Aug 17 22:46:09 CST 2025)

TARGET_INC_DIR := ./inc
TARGET_BIN_DIR := ./bin
TARGET_LIB_DIR := ./lib

<<<<<<< HEAD
PROJECT_ROOT = .
PROJECT_DIR_BESIDES  = \(
PROJECT_DIR_BESIDES += -path ./.git
PROJECT_DIR_BESIDES += -o -path ./libcpp
PROJECT_DIR_BESIDES += -o -path ./libstring
PROJECT_DIR_BESIDES += -o -path ./liburl
PROJECT_DIR_BESIDES += -o -path ./libstream
PROJECT_DIR_BESIDES += -o -path ./libast
PROJECT_DIR_BESIDES += -o -path ./libecho
PROJECT_DIR_BESIDES += -o -path ./libmodel
PROJECT_DIR_BESIDES += -o -path ./libmodule
PROJECT_DIR_BESIDES += -o -path ./libevent
PROJECT_DIR_BESIDES += -o -path ./libfsevent
PROJECT_DIR_BESIDES += -o -path ./libioevent
PROJECT_DIR_BESIDES += -o -path ./libvm
PROJECT_DIR_BESIDES += -o -path ./libes
PROJECT_DIR_BESIDES += -o -path ./libarguments
PROJECT_DIR_BESIDES += -o -path ./libmit
PROJECT_DIR_BESIDES += -o -path ./libraries
PROJECT_DIR_BESIDES += -o -path ./modules
PROJECT_DIR_BESIDES += -o -path ./obj
PROJECT_DIR_BESIDES += -o -path ./bin
PROJECT_DIR_BESIDES += -o -path ./lib
PROJECT_DIR_BESIDES += -o -path ./man
PROJECT_DIR_BESIDES += -o -path ./.trash
PROJECT_DIR_BESIDES += \)
PROJECT_DIRS   = $(shell find $(PROJECT_ROOT) $(PROJECT_DIR_BESIDES) -prune -o -type d -print) #maxdepth
=======
SOURCE_DIRS   = $(shell find $(SOURCE_ROOT_DIRS) $(SOURCE_DIR_BESIDES) -prune -o -type d -print)
>>>>>>> 40f4c7b (Sun Aug 17 22:46:09 CST 2025)

TARGET_HEADERS = $(foreach dir,$(SOURCE_DIRS),$(wildcard $(dir)/*.h))

TARGET_SOURCES_AS  += $(foreach dir,$(SOURCE_DIRS),$(wildcard $(dir)/*.s))
TARGET_OBJECTS_AS  += $(patsubst %.s,%.o,$(TARGET_SOURCES_AS))
TARGET_SOURCES_CC  += $(foreach dir,$(SOURCE_DIRS),$(wildcard $(dir)/*.c))
TARGET_OBJECTS_CC  += $(patsubst %.c,%.o,$(TARGET_SOURCES_CC))
TARGET_SOURCES_PP  += $(foreach dir,$(SOURCE_DIRS),$(wildcard $(dir)/*.cpp))
TARGET_OBJECTS_PP  += $(patsubst %.cpp,%.o,$(TARGET_SOURCES_PP))

TARGET_HEADER_DIRS += $(foreach dir,$(SOURCE_DIRS),-I$(dir))

<<<<<<< HEAD
# 链接库配置
TARGET_LD_FLAGS    = -L ./lib -Wl,-rpath=${INSTALL_PATH_PREFIX}/versions/${TARGET_VERSION}/lib

# 需要链接的库  -lstring -lurl
TARGET_LIBS = -lelf -larguments -lioevent -lfsevent -levent -lmit -lecho -les -last -lvm -lmodule -lmodel -lstream -lurl -lstring -lcpp -lstdc++ -lc         

ASFLAGS =
CCFLAGS = -c -fPIC -Wall -fvisibility=hidden -std=c++11 -I ./inc
PPFLAGS = -c -fPIC -Wall -fvisibility=hidden -std=c++11 -I ./inc

#OPENSSL=
ifdef OPENSSL
OPENSSL_INCLUDE_PATH = ${OPENSSL}/include
OPENSSL_LIBRARY_PATH = ${OPENSSL}/lib
TARGET_LD_FLAGS += -L ${OPENSSL_LIBRARY_PATH}
TARGET_LIBS += -ltls
CCFLAGS += -I ${OPENSSL_INCLUDE_PATH}
PPFLAGS += -I ${OPENSSL_INCLUDE_PATH}
CCFLAGS += -DOPENSSL
PPFLAGS += -DOPENSSL
endif
# 平台检测 -- DARWIN
=======
# libraries to be linked with.[NOTICE: also defined in .make/config]
TARGET_LIBS += -lstdc++

>>>>>>> 40f4c7b (Sun Aug 17 22:46:09 CST 2025)
ifeq (${PLATFORM_ARCH},${PLATFORM_ARCH_DARWIN})
    TARGET_BIN_EXT         :=
    TARGET_LIB_EXT_STATIC  := .a
    TARGET_LIB_EXT_DYNAMIC := .so
endif
ifeq (${PLATFORM_ARCH},${PLATFORM_ARCH_LINUX})
    TARGET_BIN_EXT         :=
<<<<<<< HEAD
    TARGET_LIB_EXT_STATIC  := a
    CTARGET_LIB_EXT_DYNAMIC := so
=======
    TARGET_LIB_EXT_STATIC  := .a
    TARGET_LIB_EXT_DYNAMIC := .so
>>>>>>> 40f4c7b (Sun Aug 17 22:46:09 CST 2025)
endif
ifeq (${PLATFORM_ARCH},${PLATFORM_ARCH_FreeBSD})
    TARGET_BIN_EXT         := 
    TARGET_LIB_EXT_STATIC  := .a
    TARGET_LIB_EXT_DYNAMIC := .so
endif

<<<<<<< HEAD
TARGETS = 

MAKE_FILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MAKE_FILE_DIR  := $(dir $(MAKE_FILE_PATH))

export SUPER_LIBRARY_ROOT = $(MAKE_FILE_DIR)libraries
export SUPER_INCLUDE_PATH = $(MAKE_FILE_DIR)inc
export SUPER_LIBRARY_PATH = $(MAKE_FILE_DIR)lib
export SUPER_RUNTIME_PATH = $(INSTALL_PATH_PREFIX)

=======
>>>>>>> 40f4c7b (Sun Aug 17 22:46:09 CST 2025)
ifeq ($(TARGET_TYPE_LIB),$(MK_TRUE))
TARGETS += ${TARGET_LIB_DIR}/${TARGET_NAME}${TARGET_LIB_EXT_STATIC}
endif
ifeq ($(TARGET_TYPE_DLL),$(MK_TRUE))
TARGETS += ${TARGET_LIB_DIR}/${TARGET_NAME}${TARGET_LIB_EXT_DYNAMIC}
endif
ifeq ($(TARGET_TYPE_BIN),$(MK_TRUE))
<<<<<<< HEAD
TARGETS += ${TARGET_BIN_DIR}/${TARGET_NAME}
endif

ALL : $(TARGETS)

${TARGET_BIN_DIR}/${TARGET_NAME}: $(TARGET_OBJECTS_PP) $(TARGET_OBJECTS_CC) $(TARGET_OBJECTS_AS)
	$(CC) -fPIE -o $@ $^ -static $(TARGET_LIBS) ${TARGET_LD_FLAGS}
=======
TARGETS += ${TARGET_BIN_DIR}/${TARGET_NAME}${TARGET_BIN_EXT}
endif

ALL : $(DEPEND_TARGETS) $(TARGETS)
	
${TARGET_LIB_DIR}/${TARGET_NAME}${TARGET_LIB_EXT_STATIC}:$(TARGET_OBJECTS_PP) $(TARGET_OBJECTS_CC) $(TARGET_OBJECTS_AS)
	$(AR) -crvs $@ $^

${TARGET_LIB_DIR}/${TARGET_NAME}${TARGET_LIB_EXT_DYNAMIC}:$(TARGET_OBJECTS_PP) $(TARGET_OBJECTS_CC) $(TARGET_OBJECTS_AS)
	$(CC) -fPIC -shared  -o $@ $^ ${LDFLAGS} $(TARGET_LIBS)

${TARGET_BIN_DIR}/${TARGET_NAME}${TARGET_BIN_EXT}: $(TARGET_OBJECTS_PP) $(TARGET_OBJECTS_CC) $(TARGET_OBJECTS_AS)
	$(PP) -o $@ $^  $(TARGET_LIBS) ${TARGET_LD_FLAGS} -fPIE #-static
>>>>>>> 40f4c7b (Sun Aug 17 22:46:09 CST 2025)

$(TARGET_OBJECTS_AS):%.o:%.s
	$(AS) ${ASFLAGS} $< -o $@
$(TARGET_OBJECTS_CC):%.o:%.c
	$(CC) ${CCFLAGS} $< -o $@ 
$(TARGET_OBJECTS_PP):%.o:%.cpp
	$(PP) ${PPFLAGS} $< -o $@

submodule:
	rm -rf ./inc/*
	rm -rf ./lib/*
	-mkdir ./inc/modules
	-mkdir ./lib/modules
	-cd ./libraries/libcpp       && $(MAKE) && cd ../.. && cp -rf ./libraries/libcpp/lib/*        ./lib && mkdir inc/libcpp       && cp -rf ./libraries/libcpp/src/*.h        ./inc/libcpp
	-cd ./libraries/libmm        && $(MAKE) && cd ../.. && cp -rf ./libraries/libmm/lib/*         ./lib && mkdir inc/libmm        && cp -rf ./libraries/libmm/src/*.h         ./inc/libmm
	-cd ./libraries/libstring    && $(MAKE) && cd ../.. && cp -rf ./libraries/libstring/lib/*     ./lib && mkdir inc/libstring    && cp -rf ./libraries/libstring/src/*.h     ./inc/libstring
	-cd ./libraries/liburl       && $(MAKE) && cd ../.. && cp -rf ./libraries/liburl/lib/*        ./lib && mkdir inc/liburl       && cp -rf ./libraries/liburl/src/*.h        ./inc/liburl
	-cd ./libraries/libmatch     && $(MAKE) && cd ../.. && cp -rf ./libraries/libmatch/lib/*      ./lib && mkdir inc/libmatch     && cp -rf ./libraries/libmatch/src/*.h      ./inc/libmatch
	-cd ./libraries/libelf       && $(MAKE) && cd ../.. && cp -rf ./libraries/libelf/lib/*        ./lib && mkdir inc/libelf       && cp -rf ./libraries/libelf/src/*.h        ./inc/libelf
	-cd ./libraries/libhttp      && $(MAKE) && cd ../.. && cp -rf ./libraries/libhttp/lib/*       ./lib && mkdir inc/libhttp      && cp -rf ./libraries/libhttp/src/*.h       ./inc/libhttp
	-cd ./libraries/libstream    && $(MAKE) && cd ../.. && cp -rf ./libraries/libstream/lib/*     ./lib && mkdir inc/libstream    && cp -rf ./libraries/libstream/src/*.h     ./inc/libstream
	-cd ./libraries/libmodel     && $(MAKE) && cd ../.. && cp -rf ./libraries/libmodel/lib/*      ./lib && mkdir inc/libmodel     && cp -rf ./libraries/libmodel/src/*.h      ./inc/libmodel
	-cd ./libraries/libmodule    && $(MAKE) && cd ../.. && cp -rf ./libraries/libmodule/lib/*     ./lib && mkdir inc/libmodule    && cp -rf ./libraries/libmodule/src/*.h     ./inc/libmodule
	-cd ./libraries/libast       && $(MAKE) && cd ../.. && cp -rf ./libraries/libast/lib/*        ./lib && mkdir inc/libast       && cp -rf ./libraries/libast/src/*.h        ./inc/libast
	-cd ./libraries/libkernel    && $(MAKE) && cd ../.. && cp -rf ./libraries/libkernel/lib/*     ./lib && mkdir inc/libkernel    && cp -rf ./libraries/libkernel/src/*.h     ./inc/libkernel
	-cd ./libraries/libsystem    && $(MAKE) && cd ../.. && cp -rf ./libraries/libsystem/lib/*     ./lib && mkdir inc/libsystem    && cp -rf ./libraries/libsystem/src/*.h     ./inc/libsystem
	-cd ./libraries/libecho      && $(MAKE) && cd ../.. && cp -rf ./libraries/libecho/lib/*       ./lib && mkdir inc/libecho      && cp -rf ./libraries/libecho/src/*.h       ./inc/libecho
	-cd ./libraries/libevent     && $(MAKE) && cd ../.. && cp -rf ./libraries/libevent/lib/*      ./lib && mkdir inc/libevent     && cp -rf ./libraries/libevent/src/*.h      ./inc/libevent
	-cd ./libraries/libioevent   && $(MAKE) && cd ../.. && cp -rf ./libraries/libioevent/lib/*    ./lib && mkdir inc/libioevent   && cp -rf ./libraries/libioevent/src/*.h    ./inc/libioevent
	-cd ./libraries/libfsevent   && $(MAKE) && cd ../.. && cp -rf ./libraries/libfsevent/lib/*    ./lib && mkdir inc/libfsevent   && cp -rf ./libraries/libfsevent/src/*.h    ./inc/libfsevent
	-cd ./libraries/libipc       && $(MAKE) && cd ../.. && cp -rf ./libraries/libipc/lib/*        ./lib && mkdir inc/libipc       && cp -rf ./libraries/libipc/src/*.h        ./inc/libipc
	-cd ./libraries/libvm        && $(MAKE) && cd ../.. && cp -rf ./libraries/libvm/lib/*         ./lib && mkdir inc/libvm        && cp -rf ./libraries/libvm/src/*.h         ./inc/libvm
	-cd ./libraries/libvn        && $(MAKE) && cd ../.. && cp -rf ./libraries/libvn/lib/*         ./lib && mkdir inc/libvn        && cp -rf ./libraries/libvn/src/*.h         ./inc/libvn
	-cd ./libraries/libvh        && $(MAKE) && cd ../.. && cp -rf ./libraries/libvh/lib/*         ./lib && mkdir inc/libvh        && cp -rf ./libraries/libvh/src/*.h         ./inc/libvh
	-cd ./libraries/libes        && $(MAKE) && cd ../.. && cp -rf ./libraries/libes/lib/*         ./lib && mkdir inc/libes        && cp -rf ./libraries/libes/src/*.h         ./inc/libes
	-cd ./libraries/libarguments && $(MAKE) && cd ../.. && cp -rf ./libraries/libarguments/lib/*  ./lib && mkdir inc/libarguments && cp -rf ./libraries/libarguments/src/*.h  ./inc/libarguments
	-cd ./libraries/libmit       && $(MAKE) && cd ../.. && cp -rf ./libraries/libmit/lib/*        ./lib && mkdir inc/libmit       && cp -rf ./libraries/libmit/src/*.h        ./inc/libmit
	-cd ./modules/io_event_tls_engine  && $(MAKE) && cd ../../ && cp -rf ./modules/io_event_tls_engine/lib/*   ./lib/modules && mkdir inc/modules/io_event_tls_engine  && cp -rf ./modules/io_event_tls_engine/src/*.h   ./inc/modules/io_event_tls_engine
	-cd ./modules/ast_standard_modules && $(MAKE) && cd ../../ && cp -rf ./modules/ast_standard_modules/lib/*  ./lib/modules && mkdir inc/modules/ast_standard_modules && cp -rf ./modules/ast_standard_modules/src/*.h  ./inc/modules/ast_standard_modules
	-cd ./modules/es_language_js       && $(MAKE) && cd ../../ && cp -rf ./modules/es_language_js/lib/*        ./lib/modules && mkdir inc/modules/es_language_js       && cp -rf ./modules/es_language_js/src/*.h        ./inc/modules/es_language_js

subheader:
	rm -rf ./inc/*
	-mkdir ./inc/modules
	-mkdir inc/libcpp       && cp -rf ./libraries/libcpp/src/*.h        ./inc/libcpp
	-mkdir inc/libmm        && cp -rf ./libraries/libmm/src/*.h         ./inc/libmm
	-mkdir inc/libstring    && cp -rf ./libraries/libstring/src/*.h     ./inc/libstring
	-mkdir inc/liburl       && cp -rf ./libraries/liburl/src/*.h        ./inc/liburl
	-mkdir inc/libmatch     && cp -rf ./libraries/libmatch/src/*.h      ./inc/libmatch
	-mkdir inc/libelf       && cp -rf ./libraries/libelf/src/*.h        ./inc/libelf
	-mkdir inc/libhttp      && cp -rf ./libraries/libhttp/src/*.h       ./inc/libhttp
	-mkdir inc/libstream    && cp -rf ./libraries/libstream/src/*.h     ./inc/libstream
	-mkdir inc/libmodel     && cp -rf ./libraries/libmodel/src/*.h      ./inc/libmodel
	-mkdir inc/libmodule    && cp -rf ./libraries/libmodule/src/*.h     ./inc/libmodule
	-mkdir inc/libast       && cp -rf ./libraries/libast/src/*.h        ./inc/libast
	-mkdir inc/libkernel    && cp -rf ./libraries/libkernel/src/*.h     ./inc/libkernel
	-mkdir inc/libsystem    && cp -rf ./libraries/libsystem/src/*.h     ./inc/libsystem
	-mkdir inc/libecho      && cp -rf ./libraries/libecho/src/*.h       ./inc/libecho
	-mkdir inc/libevent     && cp -rf ./libraries/libevent/src/*.h      ./inc/libevent
	-mkdir inc/libioevent   && cp -rf ./libraries/libioevent/src/*.h    ./inc/libioevent
	-mkdir inc/libfsevent   && cp -rf ./libraries/libfsevent/src/*.h    ./inc/libfsevent
	-mkdir inc/libipc       && cp -rf ./libraries/libipc/src/*.h        ./inc/libipc
	-mkdir inc/libvm        && cp -rf ./libraries/libvm/src/*.h         ./inc/libvm
	-mkdir inc/libvn        && cp -rf ./libraries/libvn/src/*.h         ./inc/libvn
	-mkdir inc/libvh        && cp -rf ./libraries/libvh/src/*.h         ./inc/libvh
	-mkdir inc/libes        && cp -rf ./libraries/libes/src/*.h         ./inc/libes
	-mkdir inc/libarguments && cp -rf ./libraries/libarguments/src/*.h  ./inc/libarguments
	-mkdir inc/libmit       && cp -rf ./libraries/libmit/src/*.h        ./inc/libmit
	-mkdir inc/modules/io_event_tls_engine  && cp -rf ./modules/io_event_tls_engine/src/*.h   ./inc/modules/io_event_tls_engine
	-mkdir inc/modules/ast_standard_modules && cp -rf ./modules/ast_standard_modules/src/*.h  ./inc/modules/ast_standard_modules
	-mkdir inc/modules/es_language_js       && cp -rf ./modules/es_language_js/src/*.h        ./inc/modules/es_language_js

subinstall:
	-mkdir libraries
	-cd libraries && git clone https://github.com/FoxInTango/libcpp.git
	-cd libraries && git clone https://github.com/FoxInTango/libsystem.git
	-cd libraries && git clone https://github.com/FoxInTango/libmm.git
	-cd libraries && git clone https://github.com/FoxInTango/libstring.git
	-cd libraries && git clone https://github.com/FoxInTango/liburl.git
	-cd libraries && git clone https://github.com/FoxInTango/libmatch.git
	-cd libraries && git clone https://github.com/FoxInTango/libelf.git
	-cd libraries && git clone https://github.com/FoxInTango/libhttp.git
	-cd libraries && git clone https://github.com/FoxInTango/libstream.git
	-cd libraries && git clone https://github.com/FoxInTango/libast.git
	-cd libraries && git clone https://github.com/FoxInTango/libecho.git
	-cd libraries && git clone https://github.com/FoxInTango/libmodel.git
	-cd libraries && git clone https://github.com/FoxInTango/libmodule.git
	-cd libraries && git clone https://github.com/FoxInTango/libevent.git
	-cd libraries && git clone https://github.com/FoxInTango/libioevent.git
	-cd libraries && git clone https://github.com/FoxInTango/libfsevent.git
	-cd libraries && git clone https://github.com/FoxInTango/libipc.git
	-cd libraries && git clone https://github.com/FoxInTango/libvm.git
	-cd libraries && git clone https://github.com/FoxInTango/libvn.git
	-cd libraries && git clone https://github.com/FoxInTango/libvh.git
	-cd libraries && git clone https://github.com/FoxInTango/libes.git
	-cd libraries && git clone https://github.com/FoxInTango/libarguments.git
	-cd libraries && git clone https://github.com/FoxInTango/libmit.git
	-cd libraries && git clone https://github.com/FoxInTango/libkernel.git
	-mkdir modules
	-cd modules && git clone https://github.com/FoxInTango/io_event_tls_engine.git
	-cd modules && git clone https://github.com/FoxInTango/ast_standard_modules.git
	-cd modules && git clone https://github.com/FoxInTango/es_language_js.git
	-mkdir templates
	-cd templates && git clone https://github.com/FoxInTango/ast_module_template.git
	-cd templates && git clone https://github.com/FoxInTango/es_language_template.git

update:
	-git pull
	-cd ./libraries/libcpp             && git pull
	-cd ./libraries/libsystem          && git pull
	-cd ./libraries/libmm              && git pull
	-cd ./libraries/libstring          && git pull
	-cd ./libraries/liburl             && git pull
	-cd ./libraries/libmatch           && git pull
	-cd ./libraries/libelf             && git pull
	-cd ./libraries/libhttp            && git pull
	-cd ./libraries/libstream          && git pull
	-cd ./libraries/libast             && git pull
	-cd ./libraries/libecho            && git pull
	-cd ./libraries/libmodel           && git pull
	-cd ./libraries/libmodule          && git pull
	-cd ./libraries/libevent           && git pull
	-cd ./libraries/libioevent         && git pull
	-cd ./libraries/libfsevent         && git pull
	-cd ./libraries/libipc             && git pull
	-cd ./libraries/libvm              && git pull
	-cd ./libraries/libvn              && git pull
	-cd ./libraries/libvh              && git pull
	-cd ./libraries/libes              && git pull
	-cd ./libraries/libarguments       && git pull
	-cd ./libraries/libmit             && git pull
	-cd ./libraries/libkernel          && git pull
	-cd ./modules/io_event_tls_engine  && git pull
	-cd ./modules/ast_standard_modules && git pull
	-cd ./modules/es_language_js       && git pull
	-cd ./templates/ast_module_template && git pull 
	-cd ./templates/es_language_template && git pull

subclean:
	-cd ./libraries/libcpp             && $(MAKE) clean
	-cd ./libraries/libsystem          && $(MAKE) clean
	-cd ./libraries/libmm              && $(MAKE) clean
	-cd ./libraries/libstring          && $(MAKE) clean
	-cd ./libraries/liburl             && $(MAKE) clean
	-cd ./libraries/libmatch           && $(MAKE) clean
	-cd ./libraries/libelf             && $(MAKE) clean
	-cd ./libraries/libhttp            && $(MAKE) clean
	-cd ./libraries/libstream          && $(MAKE) clean
	-cd ./libraries/libast             && $(MAKE) clean
	-cd ./libraries/libecho            && $(MAKE) clean
	-cd ./libraries/libmodel           && $(MAKE) clean
	-cd ./libraries/libmodule          && $(MAKE) clean
	-cd ./libraries/libevent           && $(MAKE) clean
	-cd ./libraries/libioevent         && $(MAKE) clean
	-cd ./libraries/libfsevent         && $(MAKE) clean
	-cd ./libraries/libipc             && $(MAKE) clean
	-cd ./libraries/libvm              && $(MAKE) clean
	-cd ./libraries/libvn              && $(MAKE) clean
	-cd ./libraries/libvh              && $(MAKE) clean
	-cd ./libraries/libes              && $(MAKE) clean
	-cd ./libraries/libarguments       && $(MAKE) clean
	-cd ./libraries/libmit             && $(MAKE) clean
	-cd ./libraries/libkernel          && $(MAKE) clean
	-cd ./modules/io_event_tls_engine  && $(MAKE) clean
	-cd ./modules/ast_standard_modules && $(MAKE) clean
	-cd ./modules/es_language_js       && $(MAKE) clean
	rm lib/*.a;rm lib/*.so;rm lib/modules/*.so;rm lib/modules/*.ko

devinstall:
	-cd libraries && git clone git@github.com:FoxInTango/libcpp.git
	-cd libraries && git clone git@github.com:FoxInTango/libsystem.git
	-cd libraries && git clone git@github.com:FoxInTango/libmm.git
	-cd libraries && git clone git@github.com:FoxInTango/libstring.git
	-cd libraries && git clone git@github.com:FoxInTango/liburl.git
	-cd libraries && git clone git@github.com:FoxInTango/libmatch.git
	-cd libraries && git clone git@github.com:FoxInTango/libelf.git
	-cd libraries && git clone git@github.com:FoxInTango/libhttp.git
	-cd libraries && git clone git@github.com:FoxInTango/libstream.git
	-cd libraries && git clone git@github.com:FoxInTango/libast.git
	-cd libraries && git clone git@github.com:FoxInTango/libecho.git
	-cd libraries && git clone git@github.com:FoxInTango/libmodel.git
	-cd libraries && git clone git@github.com:FoxInTango/libmodule.git
	-cd libraries && git clone git@github.com:FoxInTango/libevent.git
	-cd libraries && git clone git@github.com:FoxInTango/libioevent.git
	-cd libraries && git clone git@github.com:FoxInTango/libfsevent.git
	-cd libraries && git clone git@github.com:FoxInTango/libipc.git
	-cd libraries && git clone git@github.com:FoxInTango/libvm.git
	-cd libraries && git clone git@github.com:FoxInTango/libvn.git
	-cd libraries && git clone git@github.com:FoxInTango/libvh.git
	-cd libraries && git clone git@github.com:FoxInTango/libes.git
	-cd libraries && git clone git@github.com:FoxInTango/libarguments.git
	-cd libraries && git clone git@github.com:FoxInTango/libmit.git
	-cd libraries && git clone git@github.com:FoxInTango/libkernel.git
	-mkdir modules
	-cd modules && git clone git@github.com:FoxInTango/io_event_tls_engine.git
	-cd modules && git clone git@github.com:FoxInTango/ast_standard_modules.git
	-cd modules && git clone git@github.com:FoxInTango/es_language_js.git
	-mkdir templates
	-cd templates && git clone git@github.com:FoxInTango/ast_module_template
	-cd templates && git clone git@github.com:FoxInTango/es_language_template

publish:
	-git add Makefile
	-git add README.md
	-git add REF.md
	-git add LICENSE
	-git add .gitignore
	-git add .gitmodules
	-git add src/*.h
	-git add src/*.cpp
	-git add etc/alpine
	-git add readme/*
	-git add inc/.keepalive
	-git add lib/.keepalive
	-git add bin/.keepalive
	-git commit -m "alpine" && git push
	-cd ./libraries/libcpp             && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libsystem          && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libmm              && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libstring          && git add . && git commit -m "alpine" && git push
	-cd ./libraries/liburl             && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libmatch           && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libelf             && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libhttp            && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libstream          && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libast             && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libecho            && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libmodel           && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libmodule          && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libevent           && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libioevent         && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libfsevent         && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libipc             && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libvm              && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libvn              && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libvh              && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libes              && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libarguments       && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libmit             && git add . && git commit -m "alpine" && git push
	-cd ./libraries/libkernel          && git add . && git commit -m "alpine" && git push
	-cd ./modules/io_event_tls_engine  && git add . && git commit -m "alpine" && git push
	-cd ./modules/ast_standard_modules && git add . && git commit -m "alpine" && git push
	-cd ./modules/es_language_js       && git add . && git commit -m "alpine" && git push
	-cd ./templates/ast_module_template && git add . && git commit -m "alpine" && git push
	-cd ./templates/es_language_template && git add . && git commit -m "alpine" && git push

clean   :
	rm -f $(TARGET_OBJECTS_AS)
	rm -f $(TARGET_OBJECTS_CC)
	rm -f $(TARGET_OBJECTS_PP)
	rm -f ${TARGET_BIN_DIR}/*
<<<<<<< HEAD
	rm -f $(TARGET_LIB_DIR)/*.a ; rm -f $(TARGET_LIB_DIR)/*.so ; rm -f $(TARGET_LIB_DIR)/modules/*.so ; rm -f $(TARGET_LIB_DIR)/modules/*.ko 
	rm -rf ${TARGET_INC_DIR}/*

INSTALL_PATH=${INSTALL_PATH_PREFIX}/versions/${TARGET_VERSION}
install :
	-mkdir -p $(INSTALL_PATH)
	-mkdir ${INSTALL_PATH}/inc
	-mkdir $(INSTALL_PATH)/bin
	-mkdir $(INSTALL_PATH)/lib
	cp -rf $(TARGET_INC_DIR)/* $(INSTALL_PATH)/inc/
	cp -rf $(TARGET_BIN_DIR)/* $(INSTALL_PATH)/bin/
	cp -rf $(TARGET_LIB_DIR)/* $(INSTALL_PATH)/lib/
	ln -s  $(INSTALL_PATH)/bin/${TARGET_NAME} /usr/local/bin/${TARGET_NAME} 
current:
	@echo current version ${TARGET_VERSION}
uninstall : 
	rm -rf $(INSTALL_PATH)
	rm -f /usr/local/bin/${TARGET_NAME}
=======
prepare:$(PREPARE_TARGETS)
ifdef SUPER_MAKE_CONFIG_DIR
ifdef ROOT_MAKE_CONFIG_DIR
ifeq (${SUPER_MAKE_CONFIG_DIR},${ROOT_MAKE_CONFIG_DIR})
	-rm $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
#prepare 1
	@echo "DEPEND_TARGETS  += $(TARGET_NAME).build"                                           >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "UPDATE_TARGETS  += $(TARGET_NAME).update"                                          >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "PUBLISH_TARGETS += $(TARGET_NAME).publish"                                         >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "ECHO_TARGETS    += $(TARGET_NAME).echo"                                            >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME):"                                                                   >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}               >> ${MAKE_CONFIG_DIR}/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) && $(MAKE) install"                                >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).build:"                                                             >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${SUPER_MAKE_DIR}               >> ${MAKE_CONFIG_DIR}/super" >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${SUPER_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super" >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) && $(MAKE) install"                                >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).clean:"                                                             >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}          >> ${MAKE_CONFIG_DIR}/super"       >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) clean"                                             >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).prepare:"                                                           >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}          >> ${MAKE_CONFIG_DIR}/super"       >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) prepare"                                           >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).install:"                                                           >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}          >> ${MAKE_CONFIG_DIR}/super"       >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) install"                                           >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).uninstall:"                                                         >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}          >> ${MAKE_CONFIG_DIR}/super"       >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) uninstall"                                         >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).publish:"                                                           >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}          >> ${MAKE_CONFIG_DIR}/super"       >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) publish"                                           >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).update:"                                                            >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}          >> ${MAKE_CONFIG_DIR}/super"       >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) update"                                            >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).echo:"                                                              >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}          >> ${MAKE_CONFIG_DIR}/super"       >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) echo"                                              >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
endif
ifneq (${SUPER_MAKE_CONFIG_DIR},${ROOT_MAKE_CONFIG_DIR})
#prepare.2
<<<<<<< HEAD
	-rm $(SUPER_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "DEPEND_TARGETS += $(TARGET_NAME).build"                                            >> $(SUPER_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "ECHO_TARGETS += $(TARGET_NAME).echo"                                               >> $(SUPER_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).build:"                                                             >> $(SUPER_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${SUPER_MAKE_DIR}               >> ${MAKE_CONFIG_DIR}/super" >> $(SUPER_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${SUPER_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super" >> $(SUPER_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) && $(MAKE) install"                                >> $(SUPER_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(SUPER_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).echo:"                                                              >> $(SUPER_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${SUPER_MAKE_DIR}               >> ${MAKE_CONFIG_DIR}/super" >> $(SUPER_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${SUPER_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super" >> $(SUPER_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) echo"                                              >> $(SUPER_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(SUPER_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
ifeq ($(wildcard $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk),)
=======
	-rm $(SUPER_MAKE_CONFIG_DIR)/depend.dir/$(TARGET_NAME).mk
	@echo "DEPEND_TARGETS += $(TARGET_NAME).build"                                            >> $(SUPER_MAKE_CONFIG_DIR)/depend.dir/$(TARGET_NAME).mk
	@echo "ECHO_TARGETS += $(TARGET_NAME).echo"                                               >> $(SUPER_MAKE_CONFIG_DIR)/depend.dir/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).build:"                                                             >> $(SUPER_MAKE_CONFIG_DIR)/depend.dir/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${SUPER_MAKE_DIR}               >> ${MAKE_CONFIG_DIR}/super" >> $(SUPER_MAKE_CONFIG_DIR)/depend.dir/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${SUPER_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super" >> $(SUPER_MAKE_CONFIG_DIR)/depend.dir/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) && $(MAKE) install"                                >> $(SUPER_MAKE_CONFIG_DIR)/depend.dir/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(SUPER_MAKE_CONFIG_DIR)/depend.dir/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).echo:"                                                              >> $(SUPER_MAKE_CONFIG_DIR)/depend.dir/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${SUPER_MAKE_DIR}               >> ${MAKE_CONFIG_DIR}/super" >> $(SUPER_MAKE_CONFIG_DIR)/depend.dir/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${SUPER_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super" >> $(SUPER_MAKE_CONFIG_DIR)/depend.dir/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) echo"                                              >> $(SUPER_MAKE_CONFIG_DIR)/depend.dir/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(SUPER_MAKE_CONFIG_DIR)/depend.dir/$(TARGET_NAME).mk
ifeq ($(wildcard $(ROOT_MAKE_CONFIG_DIR)/depend.dir/$(TARGET_NAME).mk),)
>>>>>>> 8182d55 (Wed Aug 27 00:20:21 CST 2025)
#prepare.3
	@echo "DEPEND_TARGETS  += $(TARGET_NAME).build"                                           >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "ECHO_TARGETS    += $(TARGET_NAME).echo"                                            >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME):"                                                                   >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}               >> ${MAKE_CONFIG_DIR}/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) && $(MAKE) install"                                >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).build:"                                                             >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${SUPER_MAKE_DIR}               >> ${MAKE_CONFIG_DIR}/super" >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${SUPER_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super" >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) && $(MAKE) install"                                >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).clean:"                                                             >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}          >> ${MAKE_CONFIG_DIR}/super"       >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) clean"                                             >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).prepare:"                                                           >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}          >> ${MAKE_CONFIG_DIR}/super"       >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) prepare"                                           >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).install:"                                                           >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}          >> ${MAKE_CONFIG_DIR}/super"       >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) install"                                           >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).uninstall:"                                                         >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}          >> ${MAKE_CONFIG_DIR}/super"       >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) uninstall"                                         >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).publish:"                                                           >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}          >> ${MAKE_CONFIG_DIR}/super"       >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) publish"                                           >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).update:"                                                            >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}          >> ${MAKE_CONFIG_DIR}/super"       >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) update"                                            >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "$(TARGET_NAME).echo:"                                                              >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_DIR=${ROOT_MAKE_DIR}          >> ${MAKE_CONFIG_DIR}/super"       >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	@echo SUPER_MAKE_CONFIG_DIR=${ROOT_MAKE_CONFIG_DIR} >> $(MAKE_CONFIG_DIR)/super"  >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	cd $(MAKE_FILE_DIR) && $(MAKE) echo"                                              >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
	@echo "	-rm $(MAKE_CONFIG_DIR)/super"                                                     >> $(ROOT_MAKE_CONFIG_DIR)/$(TARGET_NAME).mk
endif
endif
endif
endif
ifndef ROOT_MAKE_CONFIG_DIR
	echo "no ROOT_MAKE_CONFIG_DIR found."
endif
install :${INSTALL_TARGETS}
	@echo ${TARGET_NAME} : Installed.
uninstall : 
	-rm -rf $(HEADER_INSTALL_PATH)/$(TARGET_NAME)
	-rm -rf $(BINARY_INSTALL_PATH)/$(TARGET_NAME)${TARGET_BIN_EXT}
	-rm -rf $(LIBRARY_INSTALL_PATH)/$(TARGET_NAME).*
publish:$(PUBLISH_TARGETS)
	-git add . && git commit -m "$(shell date)" && git push
update:$(UPDATE_TARGETS)
	-git pull
echo:$(ECHO_TARGETS)
	@echo TARGET_NAME:$(TARGET_NAME)
	@echo HEADER_INSTALL_PATH:$(HEADER_INSTALL_PATH)
	@echo BINARY_INSTALL_PATH:$(BINARY_INSTALL_PATH)
	@echo LIBRARY_INSTALL_PATH:$(LIBRARY_INSTALL_PATH)
	@echo DEPENDS_LIBRARY_PATH:$(DEPENDS_LIBRARY_PATH)
	@echo DEPENDS_THIRDS_PATH:$(DEPENDS_THIRDS_PATH)
	@echo SUPER_MAKE_DIR:$(SUPER_MAKE_DIR)
	@echo SUPER_MAKE_CONFIG_DIR:$(SUPER_MAKE_CONFIG_DIR)
	@echo ROOT_MAKE_DIR:${ROOT_MAKE_DIR}
	@echo ROOT_MAKE_CONFIG_DIR:${ROOT_MAKE_CONFIG_DIR}
	@echo TOOLCHAIN_AS:${AS}
	@echo TOOLCHAIN_CC:${CC}
	@echo TOOLCHAIN_PP:${PP}
	@echo TOOLCHAIN_AR:${AR}
	@echo TOOLCHAIN_LD:${LD}
	@echo ASFLAGS:${ASFLAGS}
	@echo CCFLAGS:${CCFLAGS}
	@echo PPFLAGS:${PPFLAGS}
	@echo ARFLAGS:${ARFLAGS}
	@echo LDFLAGS:${LDFLAGS}
>>>>>>> 40f4c7b (Sun Aug 17 22:46:09 CST 2025)
