#
# Cookbook Name:: noozjunkie
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

packages=['git', 'python', 'python3-pip', 'libffi-dev', 'libxml2-dev', 'libxslt1-dev', 'python-dev', 'zlib1g-dev' , 'libjpeg-devl', 'libpng12-dev' ]

packages.each do |pkg|
  package pkg do
    action :upgrade
  end
end

user 'noozjunkie' do
  comment 'noozjunkie'
  uid 1000
  gid 'staff'
  home '/srv/noozjunkie'
  shell '/bin/bash'
end

directory '/srv/noozjunkie' do
  owner 'noozjunkie'
  group 'staff'
  mode '0755'
  action :create
end

bash 'virtualenv' do
  code <<-EOH
    pip3 install virtualenv
  EOH
end
