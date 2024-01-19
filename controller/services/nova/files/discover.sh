#!/bin/bash
echo
echo "RUN CMMAND BEFORE PROCEDDING: source admin-openrc"
echo
echo "Discovering Compute Nodes"
echo 'su -s /bin/sh -c "nova-manage cell_v2 discover_hosts --verbose" nova'
su -s /bin/sh -c "nova-manage cell_v2 discover_hosts --verbose" nova
echo 
echo "Thank You"
