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

RUN pip install ooniprobe

RUN git clone https://github.com/hack66/bet2512.git /tmp/bet2512
RUN touch /var/lib/ooni/initialized
RUN ooniprobe --info
WORKDIR /tmp/bet2512/
RUN set -x && \
    cp ooniprobe/bet2512.list /var/lib/ooni/resources/ && \
    cp ooniprobe/bet2512.yaml /usr/local/share/ooni/decks-available/
RUN ln -s /usr/local/share/ooni/decks-available/bet2512.yaml \
          /var/lib/ooni/decks-enabled/bet2512.yaml

COPY ooniprobe/ooniprobe.conf /etc/ooniprobe.conf
EXPOSE 8842
CMD ["ooniprobe-agent", "run"]
