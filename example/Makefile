# SPDX-License-Identifier: 0BSD
# -----------------------------------------------------------------------------

.POSIX:
.PHONY: all clean distclean

.SUFFIXES:
.SUFFIXES: .adoc .html .md

MKHTML = ../mkhtml

html = asciidoc.html markdown.html
html-dep = head.html

all: $(html)

clean:
	rm -f $(html)

distclean: clean

$(html): $(html-dep)

.adoc.html:
	$(MKHTML) -f asciidoc -o $@ $<

.md.html:
	$(MKHTML) -f markdown -o $@ $<
