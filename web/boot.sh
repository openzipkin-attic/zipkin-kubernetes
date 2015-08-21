#!/bin/bash
export QUERY_PORT_9411_TCP_ADDR=${QUERY_SERVICE}.${POD_NAMESPACE}.cluster.local
exec /usr/local/bin/run
