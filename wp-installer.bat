@echo on

: 環境設定（それぞれの環境に合わせて変更してください）
: 以下のサンプル例は、MAMPで http://localhost:8888/demo としてアクセスできる WordPress のインストール設定です
set sitename="demo"
set dbuser="root"
set dbpass="root"
set dbname="demo"
set dbprefix="wp_"
set dbhost="127.0.0.1:3306"
set wp_title="Demo Site"
set site_url="http://localhost:8888/demo"
set admin_user="admin"
set admin_password="admin"
set admin_email="admin@example.com"
set wp_install_dir="c:\MAMP\htdocs"

: WordPress インストール先フォルダが存在したら、処理を停止する（上書き怖い！）
if exist "%wp_install_dir\%sitename%" (
  echo "Folder exists. Stopped WordPress Installer on WP-CLI."
  goto end
)

mkdir -p "%wp_install_dir%\%sitename%"

cd "%wp_install_dir%\%sitename%"

wp core download --force --locale=ja && ^
wp core config  --dbname=%dbname% --dbuser=%dbuser% ^
 --dbpass=%dbpass% --dbhost=%dbhost% --dbprefix=%dbprefix% && ^
wp db create && ^
wp core install --url=%site_url% --title=%wp_title% --admin_user=%admin_user% ^
  --admin_password=%admin_password% --admin_email=%admin_email% && ^
wp plugin activate wp-multibyte-patch && ^
wp plugin install  logbook && ^
wp plugin activate logbook && ^
wp user create test test@example.com --role=editor

:end
