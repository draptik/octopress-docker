#!/bin/bash
gem install --no-ri --no-rdoc \
	bundler \
	execjs

cd /octopress
# Important: use `--path...`!
bundle install --path $HOME/.gem

git config --global user.name "Patrick Drechsler"
git config --global user.email "socialcoding@pdrechsler.de"
