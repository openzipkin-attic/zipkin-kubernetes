# zipkin-kubernetes

Images, controllers, and services for running a Zipkin stack on Kubernetes.

## Synopsis

    for f in {services,controllers}/*; do
        kubectl create -f $f
    done

## Cassandra

The Cassandra image is a Kubernetes-aware build. It uses the Kubernetes API to discover other Cassandra nodes, so all you have to do to scale it is change the replica count on the zipkin-cassandra controller.

Data is stored in /cassandra_data. In the default configuration, this is a temporary directory that disappears when its pod is deleted. You'll probably want to change this to use some kind of persistent storage (e.g. EBS).

See [the Kubernetes Cassandra example](https://github.com/kubernetes/kubernetes/blob/release-1.0/examples/cassandra/README.md) for more information.

## Author

Dana NicCaluim  
Airware  
<dniccaluim@airware.com>
