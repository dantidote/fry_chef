#
# Cookbook:: fry
# Recipe:: disk
#
# Copyright:: 2017, The Authors, All Rights Reserved.

mount '/media/storage' do
  device '/dev/md0'
  action [:mount, :enable]
end

mount '/media/ext1' do
  device '9c3895d9-e067-442b-88bf-1ca356454e43'
  device_type :uuid
  action [:mount, :enable]
end

mount '/media/ext2' do
  device '4675e347-32a6-4403-8228-714e1cc26ed4'
  device_type :uuid
  action [:mount, :enable]
end
