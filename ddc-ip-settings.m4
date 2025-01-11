### the "use" option ###
## different commands depending on IP version (4 or 6)
# m4 was used to create this config
# take Fritzbox IP for V4 and interface IP for VV6
define(USEIP4,`use=cmd, cmd=/usr/local/bin/extip')dnl
define(USEIP6,`usev6=cmdv6, cmdv6=/usr/local/bin/ifip6')dnl
ifelse(ip,6,`USEIP6',`USEIP4')
