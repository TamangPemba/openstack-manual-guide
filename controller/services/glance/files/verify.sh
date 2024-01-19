#!/bin/bash

echo "To verify Glance Opearation"
echo
echo "RUN THIS COMMAND BEFORE PROCEEDING: source admin-openrc "
echo
echo "Checking images present or not"
echo " glance image-list"
echo
glance image-list
echo
echo "Upload the image to the Image service"
echo "glance image-create --name "cirros" --file /root/glance/cirros-0.4.0-x86_64-disk.img --disk-format qcow2 --container-format bare --visibility=public"
echo
read -p "Do you want to upload this image? (y/n): " answer
echo

if [ "$answer" != "y" ]; then
    echo "Script execution aborted."
    exit 1
fi
echo
glance image-create --name "cirros" \
  --file /root/glance/cirros-0.4.0-x86_64-disk.img \
  --disk-format qcow2 --container-format bare \
  --visibility=public

echo 
# Confirm upload and validate attributes
echo "Listing images:"
echo "glance image-list"
glance image-list

echo
