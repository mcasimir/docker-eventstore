# geteventstore image for k8 cluster

[eventstore oss](https://geteventstore.com/) v3.8.1 docker image and k8 cluster configuration with 3 replicas.

Adapted from https://github.com/tPl0ch/kubernetes-event-store-cluster.


## Run docker image only (for local testing)

```
docker run -p 2113:2113 -p 2114:2114 -p 1113:1113 -p 1112:1112 mcasimir/eventstore
```

## Run eventstore cluster on k8

```
kubectl create -f eventstore-k8.yml
```

**NOTE:** This k8 configuration uses ephemeral storage. Make sure you'll use a persistent storage volume to keep your data safe.
