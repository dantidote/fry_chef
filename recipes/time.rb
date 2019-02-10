#
# Cookbook:: fry_chef
# Recipe:: ssh
#
# Copyright:: 2019, The Authors, All Rights Reserved.

node.default['timezone'] = "America/Detroit"

timezone node['timezone']
