#!/bin/sh

# Restore.sh is the first container run as part of the boot process #
# and it restores the etcd snapshot to a persistent location to be used by #
# rancher server #

if [ -f /backup/snapshots/snap.db ]
then
    echo "Snapshot found about to initate restore"
    ETCDCTL_API=3 etcdctl snapshot restore /backup/snapshots/snap.db --data-dir=/var/lib/rancher/etcd
    cp -r /backup/ssl/ /etc/kubernetes/
else 
    echo "No snapshot found. Continuing boot as a new setup"
fi
