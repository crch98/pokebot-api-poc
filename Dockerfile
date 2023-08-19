
FROM php:8.2-apache

WORKDIR /var/www/html

COPY . .

RUN apt-get update && apt-get install -y \ # corrected typo "install" and added "\" to continue the command in the next line
    unzip \
    libzip-dev \
    wget \
    && docker-php-ext-install zip \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \ # replaced "copy" with "curl" command to download composer
    && rm -rf /var/lib/apt/lists/* \ # added line to remove the apt lists to save disk space in the image
    && composer install --no-scripts --no-autoloader --prefer-dist

RUN chown -R www-data:www-data /var/www/html \
    && a rewrite

2enmodCOPY 000-default.conf /etc/apache2/sites-available/
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

RUN php artisan key:generate \
    && composer dump-autoload \
    && php artisan config:cache \
    && php artisan route:cache \
    && php artisan view:cache

EXPOSE 80

CMD ["apache2-foreground"]
