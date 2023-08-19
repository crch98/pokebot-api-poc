FROM php:8.2.9-alpine3.17

WORKDIR /var/www/html

RUN apk update 
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


COPY . .

RUN composer install

EXPOSE 80

CMD ["php","artisan","serve","--host=0.0.0.0"]
