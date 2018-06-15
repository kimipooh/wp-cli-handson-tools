# wp-cli-handson-tools
WP-CLI ハンズオン用のツール類をまとめたものです。
Linux, macOS を想定しています。

## mamp-php-path.txt
MAMP上の WordPress を WP-CLI で制御するために必要な、MAMPのPHPへのパスを探して設定してくれる .bash_profile 用の設定が入っています。MAMPをつかう場合には、この中身を $HOME/.bash_profile の末尾に追加しておいてください。

## wp-installer.sh
MAMPをコマンドラインから一発インストールするためのスクリプトです。

このファイルを開いて、下記の設定を変更してください。
以下のサンプル例は、MAMPで http://localhost:8888/demo としてアクセスできる WordPress のインストール設定です

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

利用方法は、
sh  wp-installer.sh
で利用できます。wp_install_dir で指定したフォルダのなかに sitename で指定したフォルダがあれば、上書き防止のため処理を終了してインストールしません。予めインストール先に指定したフォルダがないことを確認してください。
