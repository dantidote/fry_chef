#
# Cookbook:: fry_chef
# Recipe:: network
#
# Copyright:: 2017, The Authors, All Rights Reserved.

ifconfig '10.0.1.2' do
  action :enable
	device 'eno1'
	mtu '9000'
	mask '255.255.255.0'
end


ifconfig '10.0.1.3' do
  action :enable
  device 'enp4s0'
  mtu '9000'
  mask '255.255.255.0'
end

route '10.0.1.0/24' do
	device 'enp4s0'
	gateway '10.0.1.1'
end
