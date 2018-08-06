#!/bin/sh
## entrypoint script to run a scheduled etcd snapshot

# Make sure to wait for etcd cluster to be up and running #

mkdir -p /backup/snapshots/older
mkdir -p /backup/ssl

while true
do
    nc -z -v -w10 localhost 2379
    [ "$?" == "0" ] && break
    sleep 60
done

## Run the backups in a loop and snaps every 120 seconds ##
while true
do
    DATE=$(date +%d%m%y_%H%M)
    ETCDCTL_API=3 etcdctl --cacert=/etc/kubernetes/ssl/kube-ca.pem \
    --cert=/etc/kubernetes/ssl/kube-etcd-127-0-0-1.pem \
    --key=/etc/kubernetes/ssl/kube-etcd-127-0-0-1-key.pem \
    snapshot save /backup/snapshots/snap.db
    cp /backup/snapshots/snap.db /backup/snapshots/older/snapshot_${DATE}.db
    cp /etc/kubernetes/ssl/* /backup/ssl
    sleep 120
done
