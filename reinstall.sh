#!/bin/bash

# run this as sudo

apt-get -y remove --purge slapd ldap-utils 
apt-get -y autoremove
rm -rf /etc/ldap
echo "INFO - LDAP Removed"
apt-get -y install slapd ldap-utils

echo "INFO - LDAP Installed"

echo "INFO . Creating database"
# TODO run restore script
#./restore.sh

echo "INFO - Database complete"

echo "INFO - restating Apache for phpldapadmin"
/etc/init.d/apache2 restart

echo "IFNO - apache restart complete"
echo "INFO - Verifying restore"

./verify.sh

echo "INFO - COMPLETE"
