#!/bin/bash

echo "To verify Opearation"
echo
echo "RUN THIS COMMAND BEFORE PROCEEDING: source admin-openrc "
echo
echo "Listing Services"
echo
echo "openstack compute service list"
openstack compute service list
echo
echo "openstack catalog list"
openstack catalog list
echo
echo "Listing images"
echo 
echo " openstack image list"
openstack image list
echo 
echo "verifying cells and placement API are working successfully or not"
echo 
echo "nova-status upgrade check"
nova-status upgrade check
echo 
echo "Thank You"
echo
