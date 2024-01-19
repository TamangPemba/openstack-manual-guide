#!/bin/bash

echo "This script will create a nova user on a controller node. First run the VERIFY.SH before it. Do not run if verify.sh is working perfectly."
echo
echo "RUN THIS COMMAND BEFORE CONTINUE: source admin-openrc"
echo
read -p "Do you want to proceed? (y/n): " answer
echo

if [ "$answer" != "y" ]; then
    echo "Script execution aborted."
    exit 1
fi
echo
echo " Creating  nova user"
echo "openstack user create --domain default --password-prompt nova"
openstack user create --domain default --password-prompt nova
echo
echo "Add the admin role to the nova user and service project"
echo " openstack role add --project service --user nova admin"
openstack role add --project service --user nova admin

echo 
echo "Create the nova service entity"
echo "openstack service create --name nova --description "OpenStack Compute" nova"
openstack service create --name nova \
  --description "OpenStack Compute" compute
echo
echo "Create the nova service API endpoints"
echo "openstack endpoint create --region RegionOne compute public http://controller:8778"
openstack endpoint create --region RegionOne \
  compute public http://controller:8774/v2.1
echo
echo " openstack endpoint create --region RegionOne compute internal http://controller:8778"
openstack endpoint create --region RegionOne \
 compute internal http://controller:8774/v2.1
echo
echo "openstack endpoint create --region RegionOne compute admin http://controller:8778"
openstack endpoint create --region RegionOne \
  compute admin http://controller:8774/v2.1
echo
echo "Thank You"
echo
