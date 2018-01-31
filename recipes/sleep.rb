#
# Cookbook:: fry_chef
# Recipe:: sleep
#
# Copyright:: 2018, The Authors, All Rights Reserved.

cron 'sleep' do
  command 'pm-suspend'
  user 'root'
  hour '23'
  minute '30'
end
