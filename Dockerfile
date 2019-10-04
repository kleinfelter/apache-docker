FROM ubuntu:18.04

EXPOSE 80

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

RUN apt-get update && apt-get install -yq --no-install-recommends \
        apache2 

COPY conf/apache/sites-available/* /etc/apache2/sites-available/

# The next 2 lines prevent Apache whining: Could not reliably determine the server's fully qualified domain name
RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/servername.conf
RUN a2enconf servername

WORKDIR /var/www/html

