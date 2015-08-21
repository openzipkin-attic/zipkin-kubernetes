#!/bin/bash
SENTINEL_FILE=/cassandra_data/.zipkin-schema-installed

if [ ! -e $SENTINEL_FILE ]; then
    echo "*** Importing Zipkin schema"

    # start up cassandra on the loopback interface
    cp /etc/cassandra/cassandra.yaml /etc/cassandra/cassandra.yaml.orig
    perl -pi -e "s/%%ip%%/127.0.0.1/g" /etc/cassandra/cassandra.yaml
    /run.sh &
    runpid=$!

    # import schema
    while ! cqlsh -f /schema.txt; do
        sleep 1
    done

    # kill cassandra and wait for it to shut down
    killall java
    while ps $runpid; do
        sleep 1
    done

    # finish up
    mv /etc/cassandra/cassandra.yaml.orig /etc/cassandra/cassandra.yaml
    touch $SENTINEL_FILE

    echo "*** Schema import complete"
fi

exec /run.sh
