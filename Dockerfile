FROM httpd:2.4

# Install compilation dependencies
RUN apt-get update
RUN apt-get -y install make wget libssl-dev apache2-dev

# Compile DataDome module
RUN wget https://package.datadome.co/linux/DataDome-Apache-latest.tgz
RUN tar -zxvf DataDome-Apache-latest.tgz
RUN make -C DataDome-ApacheDome-* prepare
RUN make -C DataDome-ApacheDome-*
RUN make -C DataDome-ApacheDome-* install

# Activate mod_ssl for DataDome
RUN sed -i 's/#LoadModule ssl_module modules\/mod_ssl.so/LoadModule ssl_module modules\/mod_ssl.so/g' /usr/local/apache2/conf/httpd.conf

# Add DataDome configuration
COPY ./mod_datadome.conf /usr/local/apache2/conf/extra/
RUN echo 'Include conf/extra/mod_datadome.conf' >> /usr/local/apache2/conf/httpd.conf

