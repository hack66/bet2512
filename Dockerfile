FROM python:2.7.12-slim
ENV PYTHONUNBUFFERED 1

# Setup the locales in the Dockerfile
RUN set -x &&\
    apt-get -qq update &&\
    apt-get install -qq locales &&\
    locale-gen en_US.UTF-8

# Install ooniprobe dependencies
RUN set -x && \
    apt-get install -qq build-essential libdumbnet-dev libpcap-dev tor git \
                        libgeoip-dev libffi-dev python-dev python-pip libssl-dev

RUN pip install ooniprobe --target /ooniprobe

RUN git clone https://github.com/anadahz/bet2512.git /tmp/bet2512
WORKDIR /ooniprobe
COPY /tmp/bet2512/ooniprobe/bet2512.list var/lib/ooni/resources/
COPY /tmp/bet2512/ooniprobe/bet2512.yaml share/ooni/decks-available/
RUN ln -s /ooniprobe/share/ooni/share/ooni/decks-available/bet2512.yaml \
          /ooniprobe/var/lib/ooni/decks-enabled/bet2512.yaml
RUN touch var/lib/ooni/initialized

EXPOSE 8842
CMD ["ooniprobe-agent", "run"]
