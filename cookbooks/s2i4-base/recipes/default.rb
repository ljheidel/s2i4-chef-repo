#
# Cookbook Name:: s2i4-base
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
group 'sshusers' do
	action :create
	append true
	gid 200
end
