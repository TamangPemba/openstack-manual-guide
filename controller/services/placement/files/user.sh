#!/bin/bash

echo "This script will create a placement user on a controller node. First run the VERIFY.SH before it. Do not run if verify.sh is working perfectly."
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
echo " Creating  placement user"
echo "openstack user create --domain default --password-prompt placement"
openstack user create --domain default --password-prompt placement
echo
echo "Add the admin role to the placement user and service project"
echo " openstack role add --project service --user placement admin"
openstack role add --project service --user placement admin

echo 
echo "Create the placement service entity"
echo "openstack service create --name placement --description "OpenStack Placement API" placement"
openstack service create --name placement \
  --description "OpenStack Placement API" placement
echo
echo "Create the placement service API endpoints"
echo "openstack endpoint create --region RegionOne placement public http://controller:8778"
openstack endpoint create --region RegionOne \
  placement public http://controller:8778
echo
echo " openstack endpoint create --region RegionOne placement internal http://controller:8778"
openstack endpoint create --region RegionOne \
  placement internal http://controller:8778
echo
echo "openstack endpoint create --region RegionOne placement admin http://controller:8778"
openstack endpoint create --region RegionOne \
  placement admin http://controller:8778
echo
echo "Thank You"
echo
