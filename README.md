# sanoid-docker

[![Docker Pulls](https://badgen.net/docker/pulls/tonymmm1/sanoid-docker?icon=docker&label=pulls)](https://hub.docker.com/r/tonymmm1/sanoid-docker/)
[![Docker Stars](https://badgen.net/docker/stars/tonymmm1/sanoid-docker?icon=docker&label=stars)](https://hub.docker.com/r/tonymmm1/sanoid-docker/) 
[![Docker Image Size](https://badgen.net/docker/size/tonymmm1/sanoid-docker?icon=docker&label=image%20size)](https://hub.docker.com/r/tonymmm1/sanoid-docker/)

Docker image for [Sanoid](https://github.com/jimsalterjrs/sanoid) in uses such as [TrueNas Scale](https://www.truenas.com/truenas-scale/).

**This container requires privileged mode in order to execute [ZFS](https://openzfs.org/wiki/Main_Page) commands on the host system.**

Mount sanoid.conf in /etc/sanoid/sanoid.conf to set sanoid configuration.

Example:
```
docker run --privileged -d -v ./sanoid.conf:/etc/sanoid/sanoid.conf:ro tonymmm1/sanoid-docker:latest
```

[Github](https://github.com/tonymmm1/sanoid-docker)
