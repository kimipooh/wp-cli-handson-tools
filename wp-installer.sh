#!/bin/sh

export sitename="demo"

wp core download --force --locale=ja

wp core config --dbname=$sitename --dbuser=root --dbpass=root --dbhost=localhost:8889

wp db create

wp core install --url=http://localhost:8888/$sitename --title=Demo --admin_user=admin  --admin_password=admin --admin_email=admin@example.com

wp plugin activate wp-multibyte-patch

wp plugin install  logbook
wp plugin activate logbook

wp user create test test@example.com --role=editor

