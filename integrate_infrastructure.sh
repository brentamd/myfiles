#!/bin/bash

set -e

echo "Adding relationships to infrastructure services"

services="mysql rabbitmq nova-cloud-controller nova-compute cinder glance neutron-gateway openstack-dashboard ceph ceph-radosgw mongodb ceilometer heat keystone"

for service in $services
do
	juju add-relation $service nagios
	juju add-relation $service nrpe
	juju add-relation $service landscape-client
	juju add-relation $service ganglia-node

done
echo "Finished"
