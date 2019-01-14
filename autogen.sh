#!/bin/sh
if [ -x "`which autoreconf 2>/dev/null`" ] ; then
   exec autoreconf -ivf
fi

LIBTOOLIZE=libtoolize
SYSNAME=`uname`
if [ "x$SYSNAME" = "xDarwin" ] ; then
  LIBTOOLIZE=glibtoolize
fi

# Use automake-1.11 if possible, due to subdir-objects bug
# in automake-1.15.
AM=automake-1.11
ACL=aclocal-1.11
$AM --version >& /dev/null
if [ $? != 0 ]; then
    AM=automake
    ACL=aclocal
fi

$ACL -I m4 && \
    autoheader && \
    $LIBTOOLIZE && \
    autoconf && \
    $AM --add-missing --force-missing --copy
~                                                
