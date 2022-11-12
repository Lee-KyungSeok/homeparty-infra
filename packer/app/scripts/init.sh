#!/bin/bash

set -euf -o pipefail

amazon-linux-extras install epel -y
sed -i 's/#baseurl=http:\/\/download.fedoraproject.org/baseurl=https:\/\/dl.fedoraproject.org/g' /etc/yum.repos.d/epel.repo
sed -i 's/metalink=/#metalink=/g' /etc/yum.repos.d/epel.repo

yum upgrade -y

# install common
yum install -y ruby \
git \
curl \
wget

# install java
yum install java-17-amazon-corretto -y

# install codedeploy agent
wget https://aws-codedeploy-ap-northeast-2.s3.ap-northeast-2.amazonaws.com/latest/install -P /home/ec2-user
chmod +x /home/ec2-user/install
sudo /home/ec2-user/install auto

# make homeparty app dir
mkdir -p /srv/logs/homeparty-api
mkdir -p /srv/homeparty/homeparty-api/conf # application.yml
mkdir -p /srv/homeparty/homeparty-api/lib