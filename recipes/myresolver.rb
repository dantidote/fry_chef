#
# Cookbook:: fry
# Recipe:: myresolver
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['resolver']['nameservers'] = ['10.0.1.1']

include_recipe 'resolver::default'
