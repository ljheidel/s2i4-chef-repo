#
# Cookbook Name:: zabbix-wrapper
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
file "/etc/apt/sources.list.d/pgdg.list" do
  owner "root"
  group "root"
  mode 00644
  content "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main"
end

execute "include pgdg repository key" do
  command "wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -"
end

execute "update apt-get list" do
  command "sudo apt-get update"
end
