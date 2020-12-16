docker-masscan
==============

This is a minimal docker container based on Ubuntu 14.04 for learning/investigation using MASSCAN: Mass IP Port scanner.

# Description
You should run this container interactivelly and masscan console commands.

Includes:

 - Cloned masscan repo on /opt/masscan
 - Compiled an ready to use masscan binary on /usr/local/bin
 - Git, wget, curl, build-essential
   
# Masscan
   Masscan is an open source project by Robert David Graham. Check it out: [masscan github repo](https://github.com/robertdavidgraham/masscan)
   A DEF CON 22 talk explaining masscan an its capabilities is up on youtube: [DEF CON 22 Mass Scanning the Internet](https://www.youtube.com/watch?v=UOWexFaRylM)

## Users
   Runs as root user.

## Volumes
   No volumes are exposed.

## Ports
   No ports are exposed.
      
# How to run the container
## Using docker
 You need docker v1.3+ installed. To get the container up and running and drop to an interactive shell, run:
 ```
 sudo docker run --rm -it dordoka/masscan
 ```
## Using fig
 If you have `fig.sh` installed, you can just launch:
 ```
 sudo fig run masscan
 ```
### NOTE: Be careful with the destination network scanning params: masscan can mess up switches, firewalls and any other network element you can think of because of its speed. I recomend using a low packet rate. 
### DISCLAIMER Don't come back to me if you get abuse reports, your ISP angry or any of that shit. Anything you do with it it's your own business. 
### Happy learning! :)

## Others
docker build --tag=masscan:v1 .

docker run --rm masscan:v1 -h
with volume
docker run --rm -v  %cd%:/opt/masscan/output masscan:v1 104.20.6.160 -p80,81 -oX /opt/masscan/output/scan.xml

### with dnmasscan so you don't need to convert it into a IPs

docker run --rm -v  %cd%:/opt/masscan masscan:v1 /opt/masscan/domain.txt /opt/masscan/dns.log -p80,443 -oG /opt/masscan/masscan.log

