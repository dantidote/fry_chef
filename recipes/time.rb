#
# Cookbook:: fry_chef
# Recipe:: ssh
#
# Copyright:: 2019, The Authors, All Rights Reserved.

node.default['timezone'] = "America/Detroit"

if node['chef_packages']['chef']['version'] >= '14.6'
  timezone node['timezone']
else
  link '/etc/localtime' do
    to "/usr/share/zoneinfo/#{node['timezone']}"
  end
end
