@echo off

if "%1" == "" (
  echo "Usage %0 WP-CLI alias name."
  goto end
)

wp cli update --yes

# バックアップ
wp @%1  backwpup  start  1

# 本体更新
wp @%1 core update  --force  --locale=ja 

# プラグイン更新
wp @%1 plugin update --all

# テーマ更新
wp @%1 theme update --all

# 言語更新
wp @%1 language core update

:end
