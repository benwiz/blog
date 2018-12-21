#!/bin/bash

sudo rm -r _site/
git clone -b gh-pages `git config remote.origin.url` _site
bundle exec jekyll build
cd _site
git add .
git commit -am "script deploy"
git push
cd ..
