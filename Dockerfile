FROM debian:jessie
MAINTAINER Jonathan Langford <jrobinlangford@gmail.com>

RUN apt-get update && \
	apt-get install -y apt-transport-https && \
	apt-key advanced --keyserver keys.gnupg.net \
		--recv-keys 90E9F83F22250DD7 && \
	echo "deb https://releases.wikimedia.org/debian jessie-mediawiki main" \
		>> /etc/apt/sources.list.d/parsoid.list

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
	&& apt-get update \
	&& apt-get install -y nodejs parsoid

COPY config.yaml /etc/mediawiki/parsoid/config.yaml

ENTRYPOINT export PORT="8142" INTERFACE="0.0.0.0" && /usr/bin/nodejs \
/usr/lib/parsoid/src/bin/server.js -c /etc/mediawiki/parsoid/config.yaml
