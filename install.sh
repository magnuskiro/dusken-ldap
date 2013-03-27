#!/bin/bash
# run this as sudo

# packages to install
p="slapd ldap-utils phpldapadmin"

echo "INFO - Removing old Ldap installation"

apt-get -y remove --purge $p 
apt-get -y autoremove
rm -rf /etc/ldap

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
