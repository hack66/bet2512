# bet2512

A custom Dockerfile, ooniprobe test deck and URL list compiled from different
version of [blocklists](http://blocking.nba.com.cy) introduced in Cyprus

In order to run this test you will need to install the Docker engine. You can
find installation instruction related to your system
[here](https://docs.docker.com/engine/installation/#platform-support-matrix)

## Build and run the docker container

```
git clone https://github.com/anadahz/bet2512.git
docker build -t ooniprobe bet2512/ && docker run -p 8842:8842 -d ooniprobe
```
