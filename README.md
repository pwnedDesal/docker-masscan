docker-masscan
==============

[dnmasscan](https://github.com/rastating/dnmasscan) is a bash script to automate resolving a file of domain names and subsequentlly scanning them using masscan.

As masscan does not accept domain names, a file is created (specified in the second argument to the script) which will log which IP addresses resolve to which domain names for cross reference after the script has finished executing.

If no masscan options are passed to the script, it will instead use the default options, which are:

# Masscan
   Masscan is an open source project by Robert David Graham. Check it out: [masscan github repo](https://github.com/robertdavidgraham/masscan)
   A DEF CON 22 talk explaining masscan an its capabilities is up on youtube: [DEF CON 22 Mass Scanning the Internet](https://www.youtube.com/watch?v=UOWexFaRylM)


# How to run the container
## Build your image

1. git clone https://github.com/pwnedDesal/docker-masscan.git

2. cd docker-masscan

3. docker build --tag=masscan:v1 .

## Run your image as container 

`docker run --rm -v  %cd%:/opt/masscan masscan:v1 /opt/masscan/domain.txt /opt/masscan/dns.log -p80,443 -oG /opt/masscan/masscan.log`

## 

