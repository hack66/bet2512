# bet2512

A custom Dockerfile, ooniprobe test deck and URL list compiled from different
version of [blocklists](http://blocking.nba.com.cy) introduced in Cyprus.

In order to run this test you will need to install the Docker engine. You can
find installation instructions for your system
[here](https://docs.docker.com/engine/installation/#platform-support-matrix).


## Build the Docker container

First, you need to clone this git repository on your machine:

```
git clone https://github.com/anadahz/bet2512.git
```

Alternatively, if you don't have git instaled, you can download it as a file
from [here](https://github.com/anadahz/bet2512/archive/master.zip) and unzip
it in your user folder.

Then, you need to build the ooniprobe container with the following command:

```
docker build -t ooniprobe bet2512/
```

For further instructions on running Docker on Windows refer to the
[Docker documentation](https://docs.docker.com/docker-for-windows).


## Start the Docker container

In order to start running the tests run the following command (in Linux you
need to be a superuser, e.g. by using `sudo` before the command):

```
docker run -p 8842:8842 -d ooniprobe
```

If you don't shut down your system and if you don't stop the Docker container,
the tests will be running every day. Otherwise, please remember to run the
above command after each reboot, in order to re-start the container.

You can access the ooniprobe web interface by visiting `http://localhost:8842`
in your browser. If you get the `Unable to connect` page, your container is
probably not running and you need to restart it with the above command. In
Windows, you need to replace `localhost` with whatever you get back from
running:

```
docker-machine ip ooniprobe
```


### Things you should know before using ooniprobe

OONI is not designed to protect the privacy of those running the tests. Please
go through the relative page on the project website
[here](https://ooni.torproject.org/about/risks/) and only proceed if you
understand the risks involved.
