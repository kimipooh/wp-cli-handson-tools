# wp-cli-handson-tools
WordBench 大阪 （2018-06-23）で行う、WP-CLI ハンズオン用のツール類をまとめたものです。Linux, macOS を想定しています。

## wp-installer.sh
MAMP (Mac) をコマンドラインから一発インストールするためのスクリプトです。

WP Multibyte Patch を有効にし、Logbookプラグインをインストールして有効化します。ユーザーとして、 admin（管理者）、test（編集者）を作成します。

このファイルを開いて、下記の設定を変更してください。
以下のサンプル例は、MAMPで http://localhost:8888/demo としてアクセスできる WordPress のインストール設定です

```
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
```

利用方法は、MAMPを起動しておいた上で、仮に ダウンロードフォルダ（~/Downloads/）に wp-installer.sh があるとして
```
sh  ~/Downloads/wp-installer.sh
```
で利用できます。wp_install_dir で指定したフォルダのなかに sitename で指定したフォルダがあれば、上書き防止のため処理を終了してインストールしません。予めインストール先に指定したフォルダがないことを確認してください。
（上記サンプルだと、/Applications/MAMP/htdocs/demo フォルダがあればインストールをしないということです）

ハンズオンではしませんが、MAMPでより高度なインストール、削除をしたい場合には、[mamp-wp-installer](https://github.com/kimipooh/mamp-wp-installer) を GitHubにアップしているので、参考にしてみてください。httpsのサイトや、Virtualホストを試してみたければ、
- [コマンドツールで MAMP を SSL 対応しよう！ - macOS High Sierra 編 -](https://kitaney-wordpress.blogspot.jp/2017/10/mamp-ssl-macos-high-sierra.html)
を参考にしてみてはと思います。ただ、Local by Flywheel, VCCW, Wocker などのツールをつかうほうが簡単です。Linuxサーバーで行うコマンドの確認であったり、環境をすべてセットアップした上で、MAMPフォルダをまるごと圧縮して他の端末にもっていくのが簡単だというのが MAMPの特徴かと思います。

## wp-installer.bat
MAMP (Win) をコマンドラインから一発インストールするためのスクリプトです。

WP Multibyte Patch を有効にし、Logbookプラグインをインストールして有効化します。ユーザーとして、 admin（管理者）、test（編集者）を作成します。

このファイルを開いて、下記の設定を変更してください。
以下のサンプル例は、MAMPで http://localhost/demo としてアクセスできる WordPress のインストール設定です

```
set sitename="demo"
set dbuser="root"
set dbpass="root"
set dbname="demo"
set dbprefix="wp_"
set dbhost="127.0.0.1:3306"
set wp_title="Demo Site"
set site_url="http://localhost/demo"
set admin_user="admin"
set admin_password="admin"
set admin_email="admin@example.com"
set wp_install_dir="c:\MAMP\htdocs"
```

ダウンロードフォルダにダウンロードしたとすると
MAMPを起動しておいた上で、コマンドプロンプトを開いて、

```
cd Downloads
wp-install.bat
```

で実行できます。

## wp-update-all.sh

WP-CLI 自体の更新をした上で、あらかじめ設定しておいた BackWPUPプラグインでバックアップしてから、更新する一連の作業が入ったサンプルスクリプト。
あらかじめエイリアスに設定した全サイトに対して一括で処理します。

利用方法は、仮に ダウンロードフォルダ（~/Downloads/）に wp-installer.sh があるとして
```
sh  ~/Downloads/wp-update-all.sh
```
です。

## wp-update.bat

WP-CLI 自体の更新をした上で、あらかじめ設定しておいた BackWPUPプラグインでバックアップしてから、更新する一連の作業が入ったサンプルスクリプト。
あらかじめエイリアスに設定した全サイトに対して一括で処理する

ダウンロードフォルダにダウンロードしたとすると
MAMPを起動しておいた上で、コマンドプロンプトを開いて、

```
cd Downloads
wp-update-all.bat mamp-demo
```

で実行できます。
mamp-demo はWP-CLI のエイリアス名です。