#
# Cookbook:: fry
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'fry::docker'
include_recipe 'chef-client::cron'
include_recipe 'fry::myresolver'
include_recipe 'fry::disk'
include_recipe 'fry::services'
include_recipe 'fry::users'

#docker apps
include_recipe 'fry::grafana'
include_recipe 'fry::graphite'
include_recipe 'fry::sab'
include_recipe 'fry::sonarr'
#include_recipe 'fry::storj'
#include_recipe 'fry::couchpotato'
include_recipe 'fry::qbittorrent'

include_recipe 'fry::modem_stats'
include_recipe 'fry::sleep'
#include_recipe 'fry::gemini'
include_recipe 'fry::network'
include_recipe 'fry::users'
include_recipe 'fry::ssh'
#include_recipe 'fry::unifi'
include_recipe 'fry::radarr'
include_recipe 'fry::switches'
