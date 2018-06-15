#!/bin/sh 

wp cli update --yes

# バックアップ
wp @alls  backwpup  start  1

# 本体更新
wp @alls core update  --force  --locale=ja 

# プラグイン更新
wp @alls plugin update --all

# テーマ更新
wp @alls theme update --all

# 言語更新
wp @alls language core update

