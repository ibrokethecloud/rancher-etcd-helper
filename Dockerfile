FROM gmehta3/etcd-base:latest
ADD entrypoint.sh /
ADD restore.sh /
CMD [ "/entrypoint.sh" ]
