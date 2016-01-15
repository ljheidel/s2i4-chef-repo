#
# Cookbook Name:: noozjunkie
# Recipe:: app
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apache2'
include_recipe 'apache2::mod_ssl'
include_recipe 'apache2::mod_rewrite'
include_recipe 'apache2::mod_proxy'
include_recipe 'apache2::mod_proxy_http'
include_recipe 'apache2::mod_auth_basic'
include_recipe 'apache2::mod_authn_file'
include_recipe 'apache2::mod_authz_groupfile'

apache_conf 'qa.noozjunkie.com' do
  enable true
end

apache_conf 'www.noozjunkie.com' do
  enable false
end

cookbook_file '/srv/noozjunkie/htpasswd' do
  source 'htpasswd'
  owner 'noozjunkie'
  group 'staff'
  mode '0644'
  action :create
end
