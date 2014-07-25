version=0.09

name=lua-aes
dist=$(name)-$(version)

LUA_VERSION =   5.1

## Linux/BSD
PREFIX ?=          /usr/local/nginx
LDFLAGS +=         -shared

LUA_INCLUDE_DIR ?= $(PREFIX)/include
LUA_LIB_DIR ?=     $(PREFIX)/lua/lib/lua/$(LUA_VERSION)

CFLAGS ?=          -g -O -Wall
override CFLAGS += -fpic -I$(LUA_INCLUDE_DIR)

INSTALL ?= install

.PHONY: all clean dist test t

#CC = gcc
RM = rm -f

all: luaaes.so

luaaes.o: luaaes.c

luaaes.so: luaaes.o
	$(CC) $(LDFLAGS) -llua -lcrypto $^ -o $@ 

install:
	$(INSTALL) -d $(LUA_LIB_DIR)
	$(INSTALL) luaaes.so $(LUA_LIB_DIR)

clean:
	$(RM) *.so *.o
