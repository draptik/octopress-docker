#!/bin/bash
gem install bundler execjs

cd /octopress
# Important: use `--path...`!
bundle install --path $HOME/.gem
