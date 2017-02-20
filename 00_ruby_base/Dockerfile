FROM debian:jessie

MAINTAINER Patrick Drechsler <socialcoding@pdrechsler.de>

# Get the dependencies for Octopress page generation
##
## Notes:
##
## - Python 2.7 is required for using pygments gem.
## - NodeJs is required for execjs Gem
##
RUN apt-get update && \
	apt-get --no-install-recommends -y install \
	autoconf \
	bison \
	build-essential \
	libssl-dev \
	libyaml-dev \
	locales \
	libreadline6-dev \
	zlib1g-dev \
	libncurses5-dev \
	libffi-dev \
	libgdbm3 \
	libgdbm-dev \
	nodejs \
    python2.7 \
	wget \
	ca-certificates \
	curl && \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set LOCALE to UTF8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install ruby (adopted from https://hub.docker.com/r/liaisonintl/ruby-1.9.3/~/dockerfile/)
ENV RUBY_MAJOR=1.9 \
    RUBY_VERSION=1.9.3-p551 \
    RUBY_DOWNLOAD_SHA256=bb5be55cd1f49c95bb05b6f587701376b53d310eb1bb7c76fbd445a1c75b51e8 \
    RUBYGEMS_VERSION=2.6.6 \
    PATH=/usr/local/bundle/bin:$PATH
RUN set -ex && \
    curl -SL -o ruby.tar.gz "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.gz" && \
    echo "$RUBY_DOWNLOAD_SHA256 ruby.tar.gz" | sha256sum -c - && \
    mkdir -p /usr/src/ruby && \
    tar -xzf ruby.tar.gz -C /usr/src/ruby --strip-components=1 && \
    rm -f ruby.tar.gz && \
    cd /usr/src/ruby && \
    autoconf && \
    ./configure --disable-install-doc --sysconfdir=/etc/ && \
    make && \
    make install && \
    gem update --system $RUBYGEMS_VERSION && \
    rm -rf /usr/src/ruby

# Create soft link for python
RUN ln -s /usr/bin/python2.7 /usr/bin/python