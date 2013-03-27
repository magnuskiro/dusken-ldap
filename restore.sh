#!/bin/bash

# run this as sudo to restore the default ldap database. 

service slapd stop

echo "INFO - deleting DB"
rm -rf /var/lib/ldap/*

echo "INFO - Recraeting DB"
/usr/sbin/slapadd -l ./backup/std.ldif

chown -R openldap /var/lib/ldap/

service slapd start

echo "INFO - COMPLETE"
