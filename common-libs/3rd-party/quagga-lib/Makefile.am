
INCLUDES = -I$(srcdir)/include -I./ -I$(top_srcdir)/common
DEFS = @DEFS@ -DSYSCONFDIR=\"$(sysconfdir)/\"

lib_LTLIBRARIES = libcli.la

libcli_la_SOURCES = \
                      ./src/network.c ./src/pid_output.c \
                      ./src/getopt.c ./src/getopt1.c \
                      ./src/daemon.c ./src/checksum.c \
                      ./src/vector.c ./src/linklist.c \
                      ./src/vty.c ./src/command.c \
                      ./src/sockunion.c ./src/prefix.c \
                      ./src/thread.c ./src/if.c ./src/memory.c \
                      ./src/buffer.c ./src/table.c ./src/hash.c\
                      ./src/filter.c ./src/routemap.c \
                      ./src/distribute.c ./src/stream.c \
                      ./src/str.c ./src/log.c ./src/plist.c \
                      ./src/sockopt.c \
                      ./src/smux.c ./src/md5.c \
                      ./src/if_rmap.c ./src/keychain.c \
                      ./src/privs.c ./src/sigevent.c \
                      ./src/pqueue.c ./src/jhash.c \
                      ./src/memtypes.c ./src/workqueue.c

BUILT_SOURCES = memtypes.h route_types.h

# FIXME
pkginclude_HEADERS = \
    $(addprefix include/, \
    buffer.h checksum.h command.h filter.h getopt.h hash.h \
    if.h linklist.h log.h \
    memory.h network.h prefix.h routemap.h distribute.h sockunion.h \
    str.h stream.h table.h thread.h vector.h version.h vty.h zebra.h \
    plist.h zclient.h sockopt.h smux.h md5.h if_rmap.h keychain.h \
    privs.h sigevent.h pqueue.h jhash.h zassert.h memtypes.h \
    workqueue.h route_types.h)

EXTRA_DIST = $(srcdir)/src/memtypes.awk $(srcdir)/src/route_types.awk $(srcdir)/srcroute_types.txt

memtypes.h: $(srcdir)/src/memtypes.c $(srcdir)/src/memtypes.awk
	($(GAWK) -f $(srcdir)/src/memtypes.awk $(srcdir)/src/memtypes.c > $@)

route_types.h: $(srcdir)/src/route_types.txt $(srcdir)/src/route_types.awk
	($(GAWK) -f $(srcdir)/src/route_types.awk $(srcdir)/src/route_types.txt > $@)
