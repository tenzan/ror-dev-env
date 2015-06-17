#!/bin/bash
## This script installs
## ruby 2.2.2
## rails 4.2.1
## nodejs
## postgresql


# Exit on error
set -e

sudo chown vagrant:vagrant ~/work

sudo apt-get update
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
sudo apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3S
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm requirements
rvm install 2.2.2
rvm use 2.2.2 --default
ruby -v

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler

sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

gem install rails -v 4.2.1

rails -v

sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-common
sudo apt-get install -y postgresql-9.3 libpq-dev

# Create postgresql user with the name: user
sudo -u postgres createuser user -s

# Password is also - user
sudo -u postgres psql

echo "Done!"