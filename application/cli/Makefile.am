ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}

pkgconfigdir=$(libdir)/pkgconfig

bin_PROGRAMS = mulcli 

LIB_GLIB = @LIB_GLIB@
LIB_EVENT = @LIB_EVENT@
GLIB_INCLUDE = @GLIB_INCLUDE@
LIBEVENT_INCLUDE = @LIBEVENT_INCLUDE@

INCLUDES = -I. -I$(top_srcdir)/common/ -I$(top_srcdir)/mul/ \
           -I$(top_srcdir)/services/loadable/topo_routing/ \
           -I$(top_srcdir)/application/fabric/ \
           -I$(top_srcdir)/application/makdi/ \
           -I$(top_srcdir)/common-libs/3rd-party/derived-lib/include/ \
           -I$(top_srcdir)/common-libs/3rd-party/quagga-lib/include/ \
           -I$(top_srcdir)/common-libs/mul-lib/include/ \
           -I$(top_srcdir)/common-libs/util-linux/libuuid/src/

DEFS = @DEFS@ -DSYSCONFDIR=\"$(sysconfdir)/\"

mulcli_CFLAGS = -DMUL_APP_V2_MLAPI

if HAVE_MUL_VTY
mulcli_CFLAGS += -DMUL_APP_VTY
endif

mulcli_SOURCES = mul_cli.c $(top_srcdir)/common/mul_app_main.c

LD_FLAGS= @LDFLAGS@ 

if !HAVE_EXT_GLIB
LD_FLAGS += -Wl,-rpath=$(LIB_GLIB) -L$(LIB_GLIB)
INCLUDES += -I$(GLIB_INCLUDE) -I$(GLIB_INCLUDE)/../
else
LD_FLAGS += $(LIB_GLIB)
INCLUDES += $(GLIB_INCLUDE)
endif

if !HAVE_EXT_LIBEVENT
LD_FLAGS += -Wl,-rpath=$(LIB_EVENT) -L$(LIB_EVENT)
INCLUDES += -I$(LIBEVENT_INCLUDE)
endif

mulcli_LDADD = \
                $(top_builddir)/common-libs/mul-lib/.libs/libmulutil.a  \
                $(top_builddir)/application/fabric/.libs/libfab.a \
                $(top_builddir)/application/makdi/.libs/libmakdi.a \
                $(top_builddir)/services/loadable/topo_routing/./.libs/libmultr.a -lrt \
                $(top_builddir)/mul/./.libs/libmul.a \
                $(top_builddir)/common-libs/util-linux/libuuid/.libs/libuuid.a \
                -lcrypto -lssl -lglib-2.0

if HAVE_MUL_VTY
mulcli_LDADD += $(top_builddir)/common-libs/3rd-party/quagga-lib/.libs/libcli.a
endif


mulcli_LDFLAGS = $(LD_FLAGS) -lpthread -levent -lcrypt 

noinst_HEADERS = mul_cli.h
