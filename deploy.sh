#!/usr/bin/env sh
# abort on errors
set -e
# build
yarn run build
cd dist

git init
git add -A
git commit -m 'deploy: new deploy'
git push -f git@github.com:Zeonnatios/whosthispokemon.git master:gh-pages
cd -