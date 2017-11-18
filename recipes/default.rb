#
# Cookbook:: fry
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'fry::docker'
#include_recipe 'chef-client::default'
include_recipe 'fry::myresolver'
include_recipe 'fry::disk'
include_recipe 'fry::services'

#docker apps
include_recipe 'fry::grafana'
include_recipe 'fry::graphite'
include_recipe 'fry::sab'
include_recipe 'fry::sonarr'
include_recipe 'fry::storj'
include_recipe 'fry::gemini'
include_recipe 'fry::network'