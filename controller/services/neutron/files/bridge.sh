#!/bin/bash

ovs-vsctl add-br br-ens160
ovs-vsctl add-port br-ens160 ens160
ovs-vsctl set open . external-ids:ovn-bridge-mappings=provider:br-ens160
systemctl restart neutron-openvswitch-agent.service

projectID=$(openstack project list | grep service | awk '{print $2}')
openstack network create --project $projectID --share --provider-network-type flat --provider-physical-network provider sharednet1
openstack subnet create subnet1 --network sharednet1 --project $projectID  --subnet-range 10.0.0.0/24 --allocation-pool start=10.0.0.200,end=10.0.0.254 --gateway 10.0.0.1 --dns-nameserver 10.0.0.10
openstack network list
