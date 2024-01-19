#!/bin/bash
echo "This script is for to create a domain, projects, users and roles"
echo
echo "RUN THIS COMMAND BEFORE CONTINUE: source adminenv"
echo 

echo "This script will create OpenStack entities. First run the VERIFY.SH before it. Do not run if verify.sh is working perfectly."
echo
read -p "Do you want to proceed? (y/n): " answer
echo
if [ "$answer" != "y" ]; then
    echo "Script execution aborted."
    exit 1
fi
echo
echo "Creating an example domain"
echo "openstack domain create --description "An Example Domain" example"
openstack domain create --description "An Example Domain" example
echo
echo "Creating a service project"
echo " openstack project create --domain default --description "Service Project" service"
openstack project create --domain default \
  --description "Service Project" service
echo
echo "Creating a demo project"

echo "openstack project create --domain default  --description "Demo Project" myproject"
openstack project create --domain default \
  --description "Demo Project" myproject
echo
echo "Creating a demo user"
echo " openstack user create --domain default --password-prompt myuser"
openstack user create --domain default \
  --password-prompt myuser

echo
echo "Creating a custom role"
echo " openstack role create myrole"
openstack role create myrole

echo
echo "Assigning the role to the demo project and user"
openstack role add --project myproject --user myuser myrole

echo "Thank You"
