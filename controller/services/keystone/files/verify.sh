#!/bin/bash
echo "To verify the operation"
echo
# Unset existing OpenStack environment variables
echo "RUN THIS COMMAND BEFORE PROCEEDING: unset OS_AUTH_URL OS_PASSWORD"
echo

# Admin user authentication token request
echo "Requesting authentication token for the admin user..."
openstack --os-auth-url http://controller:5000/v3 \
  --os-project-domain-name Default --os-user-domain-name Default \
  --os-project-name admin --os-username admin token issue
echo
# Authentication token request for the myuser user
echo "Requesting authentication token for the myuser user..."
openstack --os-auth-url http://controller:5000/v3 \
  --os-project-domain-name Default --os-user-domain-name Default \
  --os-project-name myproject --os-username myuser token issue
echo
echo "Thank You"
