# ACI Health Check Collector through proxy servers 

This repository provides ACI Health Check Collector container which can be used at proxy-pass-through required environments.

## How to run

1. Run the container.
```
docker run -d --name aci-hc insobi/aci-health-check:latest
docker exec -ti aci-hc /bin/bash
```

2. Add a proxy info to proxylist in /etc/proxychains4.conf
```
[ProxyList]
socks5 10.10.10.10 443
```

3. Run vetr or cnae with proxychains4
```
cd /data/vetr
/opt/proxychains-ng/proxychains4 -f /etc/proxychains4.conf ./collector

cd /data/nae
/opt/proxychains-ng/proxychains4 -f /etc/proxychains4.conf python cnae_data_collection.py -clusterName POD1 -cnaeMode APIC -APIC 10.70.136.21 -user admin -apicQueryTimeOut 90
```

## Important notes
The container image insobi/aci-health-check is created by based-on moskrive/aci-health-check, but it may not follow latest version of moskrive/aci-health-check.