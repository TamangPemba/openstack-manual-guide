#!/bin/bash

echo "This script will create a glance user on a controller node. First run the VERIFY.SH before it. Do not run if verify.sh is working perfectly."
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
echo " Creating  glance user"
echo "openstack user create --domain default --password-prompt glance"
openstack user create --domain default --password-prompt glance
echo
echo "Add the admin role to the glance user and service project"
echo " openstack role add --project service --user glance admin"
openstack role add --project service --user glance admin

echo 
echo "Create the glance service entity"
echo "openstack service create --name glance --description "OpenStack Image" image"
openstack service create --name glance \
  --description "OpenStack Image" image
echo
echo "Create the Image service API endpoints"
echo "openstack endpoint create --region RegionOne image public http://controller:9292"
openstack endpoint create --region RegionOne \
  image public http://controller:9292
echo
echo " openstack endpoint create --region RegionOne image internal http://controller:9292"
openstack endpoint create --region RegionOne \
  image internal http://controller:9292
echo
echo "openstack endpoint create --region RegionOne image admin http://controller:9292"
openstack endpoint create --region RegionOne \
  image admin http://controller:9292

echo
echo "glance user has reader access to system-scope resources(like limit)"
echo "openstack role add --user glance --user-domain Default --system all reader"
openstack role add --user glance --user-domain Default --system all reader


# Register quota limits (optional)
#openstack --os-cloud devstack-system-admin registered limit create  --service glance --default-limit 1000 --region RegionOne image_size_total

#openstack --os-cloud devstack-system-admin registered limit create  --service glance --default-limit 1000 --region RegionOne image_stage_total

#openstack --os-cloud devstack-system-admin registered limit create  --service glance --default-limit 100 --region RegionOne image_count_total

#openstack --os-cloud devstack-system-admin registered limit create  --service glance --default-limit 100 --region RegionOne image_count_uploading

echo 
echo "Thank You"
echo
