#!/bin/bash


name=$1
version=$2
prefix=$3
libdir=${prefix}/lib
incdir=${prefix}/include
exedir=${prefix}/bin

echo prefix=${prefix}       > ${prefix}/lib/pkgconfig/${name}.pc
echo exec_prefix=${exedir} >> ${prefix}/lib/pkgconfig/${name}.pc
echo libdir=${libdir}      >> ${prefix}/lib/pkgconfig/${name}.pc
echo includedir=${incdir}  >> ${prefix}/lib/pkgconfig/${name}.pc

echo Name: ${name} >> ${prefix}/lib/pkgconfig/${name}.pc
echo Description: library for C++ by foxintango >> ${prefix}/lib/pkgconfig/${name}.pc
echo Version: ${version} >> ${prefix}/lib/pkgconfig/${name}.pc
echo Requires: >> ${prefix}/lib/pkgconfig/${name}.pc
echo Requires.private: >> ${prefix}/lib/pkgconfig/${name}.pc
echo Conflicts: >> ${prefix}/lib/pkgconfig/${name}.pc
echo Libs: -L${libdir} >> ${prefix}/lib/pkgconfig/${name}.pc
echo Libs.private: >> ${prefix}/lib/pkgconfig/${name}.pc
echo Cflags: -I${includedir} >> ${prefix}/lib/pkgconfig/${name}.pc
