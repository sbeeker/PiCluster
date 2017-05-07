FROM resin/rpi-raspbian
MAINTAINER Scott Beeker
# Update
RUN apt-get update

# Install apache2
RUN apt-get install -y apache2

COPY apache2-foreground /usr/local/bin/

EXPOSE 80
CMD ["/usr/local/bin/apache2-foreground"]
