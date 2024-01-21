#!/bin/bash

echo "This script will create a neutron user on a controller node. First run the VERIFY.SH before it. Do not run if verify.sh is working perfectly."
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
echo " Creating  neutron user"
echo "openstack user create --domain default --password-prompt neutron"
openstack user create --domain default --password-prompt neutron
echo
echo "Add the admin role to the neutron user and service project"
echo " openstack role add --project service --user neutron admin"
openstack role add --project service --user neutron admin

echo 
echo "Create the neutron service entity"
echo 'openstack service create --name neutron --description "OpenStack Networking" network'
openstack service create --name neutron \
  --description "OpenStack Networking" network
echo
echo "Create the neutron service API endpoints"
echo "openstack endpoint create --region RegionOne network public http://controller:9696"
openstack endpoint create --region RegionOne \
  network public http://controller:9696
echo
echo " openstack endpoint create --region RegionOne network internal http://controller:9696"
openstack endpoint create --region RegionOne \
  network internal http://controller:9696
echo
echo "openstack endpoint create --region RegionOne network admin http://controller:9696"
openstack endpoint create --region RegionOne \
  network admin http://controller:9696
echo
echo "Thank You"
echo
