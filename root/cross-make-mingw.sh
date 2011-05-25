#!/bin/sh

PREFIX=/usr/i586-mingw32msvc
TARGET=i586-mingw32msvc
PATH="$PREFIX/bin:$PREFIX/$TARGET/bin:$PREFIX/usr/include:$PATH"
export PATH
export PLATFORM=mingw32
exec make $*
