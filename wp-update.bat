@echo off

if "%1" == "" (
  echo "Usage %0 WP-CLI alias name."
  goto end
)

wp @%1  backwpup  start  1 && ^
wp @%1 core update  --force  --locale=ja && ^
wp @%1 plugin update --all && ^
wp @%1 theme update --all && ^
wp @%1 language core update

:end
