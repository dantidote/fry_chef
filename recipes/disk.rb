#
# Cookbook:: fry
# Recipe:: disk
#
# Copyright:: 2017, The Authors, All Rights Reserved.

mount '/media/storage' do
  device '/dev/md0'
  action [:mount, :enable]
end
