#!/bin/bash
TEMPFILE=`mktemp /tmp/resolv.conf.XXXXXX`
echo search hacking-lab.com >> $TEMPFILE
for DHCPOPTVAR in ${!foreign_option*} ; do
    DHCPOPT="${!DHCPOPTVAR}"
    if echo $DHCPOPT | grep -qe '^dhcp-option.DNS' ; then
        echo $DHCPOPT | sed -re 's/dhcp-option.DNS.([0-9.]+)$/nameserver \1/' >> $TEMPFILE
    fi
done
mv -f /etc/resolv.conf /etc/resolv.conf.old
mv -f $TEMPFILE /etc/resolv.conf
chmod 644 /etc/resolv.conf
