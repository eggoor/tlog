CONFIG ?= debug

# Compiler and flags
CC ?= gcc

UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S), Darwin)
    CC = clang
endif

ifeq ($(CONFIG), debug)
    CFLAGS = -g -O0 -DDEBUG -std=c99 -Wall -W -Wno-deprecated -Wno-deprecated-declarations
    PREFIX = /tmp
else ifeq ($(CONFIG), release)
    CFLAGS = -O2 -DNDEBUG -Wall -std=c99 -Wall -W -Wno-deprecated -Wno-deprecated-declarations
    PREFIX = /usr/local
else
    $(error Unknown CONFIG '$(CONFIG)'. Use either 'debug' or 'release')
endif

NAME = tlog
MAJOR = 1
MINOR = 0
PATCH = 0

LIBNAME = lib$(NAME)-$(MAJOR).$(MINOR).$(PATCH).a

export LIBNAME
export PREFIX
export CC
export CFLAGS

.PHONY: src

all:
	$(MAKE) -C src
	
clean:
	$(MAKE) -C src clean
	
install:
	$(MAKE) -C src install
	install -m 644 $(LIBNAME) $(PREFIX)/lib/
