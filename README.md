# bet2512

A custom Dockerfile, ooniprobe test deck and URL list compiled from different
version of [blocklists](http://blocking.nba.com.cy) introduced in Cyprus.

In order to run this test you will need to install the Docker engine. You can
find installation instructions for your system
[here](https://docs.docker.com/engine/installation/#platform-support-matrix).

In Linux, you need to be a superuser when invoking `docker`, e.g. by using
`sudo` before each of the `docker` commands. Therefore, instead of:

```
docker ps
```

you need to execute:

```
sudo docker ps
```

and provide your user password.


## Build the Docker container

First, you need to clone this git repository on your machine:

```
git clone https://github.com/hack66/bet2512.git
```

Alternatively, if you don't have git installed, you can download it as a file
from [here](https://github.com/hack66/bet2512/archive/master.zip) and unzip
it in your user folder.

Then, you can build the ooniprobe container with the following command:

```
docker build -t ooniprobe bet2512/
```

For further instructions on running Docker on Windows refer to the
[Docker documentation](https://docs.docker.com/docker-for-windows).


## Start the Docker container

In order to start running the tests run the following command:

```
docker run -p 8842:8842 -d ooniprobe
```

The measurements will take some time to complete, so please allow at least
three hours before disconnecting from the Internet.

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

## Uninstalling ooniprobe


First, you need to find the ID of the ooniprobe Docker container:

```
docker ps -q --filter ancestor=ooniprobe
```

Copy the output of the previous command and use it in place of CONTID in the
the following commands:

```
docker stop CONTID
docker rm CONTID
```

Now you can uninstall the Docker engine. For Windows, you can find the official
guide [here](https://docs.docker.com/toolbox/toolbox_install_windows/#how-to-uninstall-toolbox).

### Things you should know before using ooniprobe

OONI is not designed to protect the privacy of those running the tests. Please
go through the relative page on the project website
[here](https://ooni.torproject.org/about/risks/) and only proceed if you
understand the risks involved.

Thank you for taking the time to run the tests, we will update this page with
the findings in early April.
