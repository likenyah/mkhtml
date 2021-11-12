# SPDX-License-Identifier: 0BSD
# -----------------------------------------------------------------------------

.POSIX:
.PHONY: all clean distclean check man install install-man

.SUFFIXES:
.SUFFIXES: .1 .adoc

V = 0

ASCIIDOC = asciidoctor
SHELLCHECK = shellcheck

PREFIX = $(HOME)/.local
DATADIR = $(PREFIX)/share
BINDIR = $(PREFIX)/bin
MANDIR = $(DATADIR)/man

V_MAJOR = 0
V_MINOR = 1
V_PATCH = 0
V_EXTRA =
VERSION = $(V_MAJOR).$(V_MINOR).$(V_PATCH)$(V_EXTRA)

Q0 = @
Q1 =
Q = $(Q$(V))

msg0 = printf "  %-7s %s\\n"
msg1 = :
msg = $(msg$(V))
qmsg = @$(msg)

all:

clean:
	$(qmsg) "CLEAN" ""
	$(Q)rm -f mkhtml.1

distclean: clean
	$(qmsg) "DISTCLEAN" ""

check:
	$(qmsg) "CHECK" "mkhtml"
	$(Q)$(SHELLCHECK) -f gcc -s sh -x "mkhtml"

man: mkhtml.1

install:
	$(qmsg) "INSTALL" "$(DESTDIR)$(BINDIR)/mkhtml"
	$(Q)scripts/atomic-install -D -m 0755 "mkhtml" "$(DESTDIR)$(BINDIR)/mkhtml"

install-man:
	$(qmsg) "INSTALL" "$(DESTDIR)$(MANDIR)/man1/mkhtml.1"
	$(Q)scripts/atomic-install -D -m 0644 "mkhtml.1" "$(DESTDIR)$(MANDIR)/man1/mkhtml.1"

.adoc.1:
	$(qmsg) "GEN" "$@"
	$(Q)$(ASCIIDOC) -a VERSION="$(VERSION)" -b manpage -o "$@" "$<"
