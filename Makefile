SHELL = /bin/bash
TARGETS = ddclient.conf ddclientipv6.conf
SOURCES = ddc-common-settings.m4 ddc-ip-settings.m4 ddc-dns-records.m4 ddc-dns-records.m4 
# SOURCES = ddc-common-settings.m4 ddc-ip-settings.m4 ddc-dns-records.m4 ddc-dns-records-for-test.m4
ETCDIR = /usr/local/bin

conf: $(TARGETS)

install: $(TARGETS)
	@for n in $(TARGETS);\
	do \
	diff -q $$n $(ETCDIR)/$$n > /dev/null;\
	if [ "$$?" != "0"	];then \
	   echo sudo install -m 644 -t $(ETCDIR) $$n;\
	   sudo install -m 755 -t $(ETCDIR) $$n;\
	fi;\
	done;\

ddclient.conf:
	m4 -D ip=4 $(SOURCES) > ddclient.conf

ddclientipv6.conf:
	m4 -D ip=6 $(SOURCES) > ddclientipv6.conf

