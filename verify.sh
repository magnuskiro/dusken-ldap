#!/bin/sh

echo "INFO-----Verifying ldap restore"

echo "INFO-----Verifying schema"
sudo ldapsearch -Q -LLL -Y EXTERNAL -H ldapi:/// -b cn=config dn

echo "INFO-----Verifying admin dn"
ldapsearch -x -LLL -H ldap:/// -b dc=dusken,dc=no dn

echo "INFO-----Verifying user"
ldapsearch -x -LLL -b dc=dusken,dc=no 'uid=john' cn gidNumber

echo "INFO----- Verifying complete"
