#!/bin/bash

# NOTE: Currently I'm not using any plugins unsupported by github, so I can just push normal code straight to master.

sudo rm -r _site/
git clone -b gh-pages `git config remote.origin.url` _site
bundle exec jekyll build
cd _site
git add .
git commit -am "script deploy"
git push
cd ..
