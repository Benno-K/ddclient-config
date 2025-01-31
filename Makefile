SHELL = /bin/bash
TARGETS = ddclient.conf ddclientipv6.conf
SOURCES = ddc-common-settings.m4 ~pi/.config/ddcreds ddc-ip-settings.m4 ddc-dns-records.m4
# SOURCES = ddc-common-settings.m4 ddc-ip-settings.m4 ddc-dns-records.m4 ddc-dns-records-for-test.m4
ETCDIR = /etc
ETCTARGETS = $(ETCDIR)/ddclient.conf $(ETCDIR)/ddclientipv6.conf

conf: Makefile $(TARGETS)

reload: $(ETCTARGETS) reload4 reload6

install:
	@for n in $(TARGETS);\
	do \
   echo sudo install -m 644 -t $(ETCDIR) $$n;\
   sudo install -m 700 -t $(ETCDIR) $$n;\
	done

reload4:
	sudo service ddclient force-reload 

reload6:
	sudo service ddclient6 force-reload 

clean:
	rm -f $(TARGETS)

ddclient.conf: $(SOURCES)
	m4 -D ip=4 $(SOURCES) > ddclient.conf

ddclientipv6.conf: $(SOURCES)
	m4 -D ip=6 $(SOURCES) > ddclientipv6.conf

