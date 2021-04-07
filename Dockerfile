FROM ubuntu:latest

MAINTAINER Carlos Moro <cmoro@deusto.es>

# Set locales
# RUN locale-gen en_GB.UTF-8
# ENV LANG en_GB.UTF-8
# ENV LC_CTYPE en_GB.UTF-8
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Fix sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install dependencies
RUN apt-get update
RUN apt-get install -y git build-essential curl wget libpcap-dev
RUN apt install -y dnsutils
RUN apt-get --assume-yes install git make gcc

# Clone masscan git repo
RUN git clone https://github.com/robertdavidgraham/masscan /opt/masscan
WORKDIR /opt/masscan
COPY dnmasscan.sh .
RUN mkdir /opt/masscan/output

# Make masscan
RUN make -j

# Copy binary
RUN cp /opt/masscan/bin/masscan /usr/local/bin

# Launch Bash
ENTRYPOINT ["/opt/masscan/dnmasscan.sh"]
