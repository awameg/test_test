FROM php:7.2-apache
RUN apt-get update -y && apt-get install git -y && \
    git clone https://github.com/Monopex/test.git
ENV APACHE_DOCUMENT_ROOT /test
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
