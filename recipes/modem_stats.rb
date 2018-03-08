#
# Cookbook:: fry_chef
# Recipe:: modem_stats
#
# Copyright:: 2018, The Authors, All Rights Reserved.

cron 'modem' do
  command '/usr/bin/python3 /media/storage/Source/modemstats/sb8200.py'
  user 'root'
  minute '*'
end
