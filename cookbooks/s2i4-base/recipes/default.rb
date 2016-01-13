#
# Cookbook Name:: s2i4-base
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
# include_recipe 'apt'

bash 'update_apt' do
  code <<-EOH
    apt-get update
  EOH
end

group 'sshusers' do
	action :create
	append true
	gid 200
end
directory '/etc/zabbix' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end 

directory '/etc/zabbix/agent_include' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end 

cookbook_file '/etc/zabbix/agent_include/metadata.conf' do
  source 'zabbix/metadata.conf'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

node.set['zabbix']['agent']['listen_ip'] = node.ipaddress
