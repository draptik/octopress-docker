#!/bin/bash
gem install --no-ri --no-rdoc \
	bundler -v 1.16
gem install --no-ri --no-rdoc \
	execjs -v 2.7.0

cd /octopress
# Important: use `--path...`!
bundle install --path $HOME/.gem

git config --global user.name "Patrick Drechsler"
git config --global user.email "socialcoding@pdrechsler.de"
