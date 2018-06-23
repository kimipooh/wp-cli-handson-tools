#!/bin/sh

## 環境設定（それぞれの環境に合わせて変更してください）
## 以下のサンプル例は、MAMPで http://localhost:8888/demo としてアクセスできる WordPress のインストール設定です
export sitename="demo"
export dbuser="root"
export dbpass="root"
export dbname="demo"
export dbprefix="wp_"
export dbhost="127.0.0.1:8889"
export wp_title="Demo Site"
export site_url="http://localhost:8888/demo"
export admin_user="admin"
export admin_password="admin"
export admin_email="admin@example.com"
export wp_install_dir="/Applications/MAMP/htdocs/"

export php_path="`ls -d /Applications/MAMP/bin/php/php* | tail -1`"
export PATH_2="$PATH"
export PATH="${php_path}/bin:/Applications/MAMP/Library/bin:$PATH"


# WordPress インストール先フォルダが存在したら、処理を停止する（上書き怖い！）
if [ -d "${wp_install_dir}/${sitename}" ]; then
  echo "Folder exists. Stopped WordPress Installer on WP-CLI."
  exit
fi

mkdir -p ${wp_install_dir}/${sitename}

cd ${wp_install_dir}/${sitename}

wp core download --force --locale=ja

wp core config --dbname="$dbname" --dbuser="$dbuser" --dbpass="$dbpass" --dbhost="$dbhost" --dbprefix="$dbprefix"

wp db create

wp core install --url="$site_url" --title="$wp_title" --admin_user="$admin_user"  --admin_password="$admin_password" --admin_email="$admin_email"

wp plugin activate wp-multibyte-patch

wp plugin install  logbook
wp plugin activate logbook

wp user create test test@example.com --role=editor

