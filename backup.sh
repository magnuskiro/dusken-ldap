#!/bin/sh

LDAPBK=ldap-$( date +%y%m%d-%H%M ).ldif

#BACKUPDIR=/home/backups
BACKUPDIR=./backup

/usr/sbin/slapcat -v -b "dc=dusken,dc=no" -l $BACKUPDIR/$LDAPBK

#gzip -9 $BACKUPDIR/$LDAPBK

