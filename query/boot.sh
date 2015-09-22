#!/bin/sh
export CASSANDRA_CONTACT_POINTS=${CASSANDRA_SERVICE}.${POD_NAMESPACE}.cluster.local
exec /usr/local/bin/run.sh
