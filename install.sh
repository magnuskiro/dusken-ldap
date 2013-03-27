#!/bin/bash
# run this as sudo

# packages to install
p="slapd ldap-utils phpldapadmin"

echo "INFO - Removing old Ldap installation"
apt-get -y remove --purge $p 
apt-get -y autoremove
rm -rf /etc/ldap

# note that ldap install uses the hostname in /etc/hots file.
# edit it as appropriate, examle:
# 127.0.1.1       ikaros.dusken.no        ikaros
echo "INFO - Installing LDAP "
apt-get -y install $p

echo "INFO - Fixing phpLdapAdmin config file" 
cp ./phpLdapCofnig.php /etc/phpldapadmin/config.php
chmod 640 /etc/phpldapadmin/config.php

echo "INFO - Creating database"
./restore.sh

echo "INFO - Populating Ldap "
# ./populate.sh

echo "INFO - Restating Apache for phpldapadmin"
/etc/init.d/apache2 restart

echo "INFO - Verifying restore"
./verify.sh

echo "INFO - COMPLETE"
