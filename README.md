### rancher-etcd-helper
The etcd-helper is designed to assist with performing regular etcd snapshots for the rancher/rancher container. 

This should help persist the configuration of the rancher master to a persistant store and will help recover from failure scenarios.

The schedular will take a snapshot of the etcd cluster every 120 seconds.

The persistent location should be mounted under the /backup folder in the etcd helper container.

Idea is to convert the single node rancher server into a ASG and allow the cloud provider to manage availability of service.

Please refer to cloud-init to see sample usage for this container.
