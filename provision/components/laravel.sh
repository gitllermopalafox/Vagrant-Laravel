#!/bin/bash

URL_REPO="https://github.com/laravel/laravel/archive"
APP_NAME=$1
VERSION=$2

echo "Cloning Laravel"
cd /var/www/src > /dev/null 2>&1

if [ $VERSION == "current" ]; then

	git clone https://github.com/laravel/laravel.git $APP_NAME > /dev/null 2>&1 

else

	wget "$URL_REPO/v$VERSION.zip" > /dev/null 2>&1
	unzip "v$VERSION.zip" > /dev/null 2>&1
	rm "v$VERSION.zip" > /dev/null 2>&1
	mv "/var/www/src/laravel-$VERSION" "/var/www/src/$APP_NAME" > /dev/null 2>&1

fi

echo "Installing Laravel (This take a while)"
cd /var/www/src/$APP_NAME > /dev/null 2>&1
composer install > /dev/null

#chown -R www-data:www-data /var/www/src > /dev/null 2>&1
#chmod -R 755 /var/www/src/laravel > /dev/null 2>&1
#chmod -R 777 /var/www/src/laravel/storage > /dev/null 2>&1

