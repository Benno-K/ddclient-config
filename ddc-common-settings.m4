define(ip,ifdef(ip,ip,4))dnl
# /etc/ddclient.conf
### Global settings ###
mail-failure=root
verbose=1
daemon=1m
timeout=10
protocol=dyndns2
pid=/var/run/ddclient-IP-v-ip.pid
# log into /var/log/syslog
syslog=1
ssl=yes
server=dyndns.strato.com
login=kardel.eu
password=stratogisches123KW
### End global settings ###

