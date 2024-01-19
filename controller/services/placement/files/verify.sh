#!/bin/bash

echo "To verify Placement Opearation"
echo
echo "RUN THIS COMMAND BEFORE PROCEEDING: source admin-openrc "
echo
echo "status checks to make sure, everything in order"
echo "placement-status upgrade check"
placement-status upgrade check
echo
echo "Installing osc-placement, if not available"
echo "pip3 install osc-placement"
apt-get install -y python3-pip
echo
pip3 install osc-placement
echo
echo "List Available resource classes and traits"
echo "openstack --os-placement-api-version 1.2 resource class list --sort-column name"
openstack --os-placement-api-version 1.2 resource class list --sort-column name
echo
echo "openstack --os-placement-api-version 1.6 trait list --sort-column name"
openstack --os-placement-api-version 1.6 trait list --sort-column name

echo
echo "Thank You"
echo
