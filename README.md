# Openshift Mirror for disconnected installations v4.12

The following scripts follow the path to create a mirror in a docker-registry container.

## Packages

1. jq
1. podman
1. oc
1. oc-mirror https://console.redhat.com/openshift/downloads

## Considerations

* The machine where the operation is running is labeled as _provision.ocp.example.com_ change all references if necessary
* The custom certificates are related to this hostname, recreate if necessary
* The custom certificates should be added to trusted anchors ```cp certs/$HOST.crt /etc/pki/ca-trust/source/anchors/. && update-ca-trust``` 
* The pull secret file (pull-secret.txt) that is obtained in https://console.redhat.com/openshift/create is downloaded, valid and placed in the "secrets/" directory
* The authentication for the docker-registry is dummy:dummy, change and recreate auth data if necessary
* You must login to the mirror registry before running 3-mirror.sh

## Operators

These are the operators considered for this mirror:
```yaml
packages:
- name: cluster-logging
  channels:
  - name: stable
  - name: stable-5.7
- name: openshift-pipelines-operator-rh
  channels:
  - name: latest
  - name: pipelines-1.10
- name: elasticsearch-operator
  channels:
  - name: stable
  - name: stable-5.7
```

Consider the following command if you wish to add/change the operators available for the mirror:

```bash
oc-mirror list operators --catalog=registry.redhat.io/redhat/redhat-operator-index:v4.12 --package=elasticsearch-operator
```

## Sizing

For this mirror, and considering the mentioned operators, the final size was:

```bash
du -sh data/
# 44G     data/
```

## References

https://docs.openshift.com/container-platform/4.12/installing/disconnected_install/installing-mirroring-disconnected.html
