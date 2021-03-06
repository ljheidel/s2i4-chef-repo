#
# Cookbook Name:: aws-vpc-nat-instance
# Recipe:: default
#
# Copyright (C) 2015 Will Salt
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'chef-sugar::default'
include_recipe 'aws-vpc-nat-instance::masquerade'

if node['aws-vpc-nat-instance']['disable_source_dest_check'] && ec2?
	include_recipe 'aws-vpc-nat-instance::ec2' 
end
