#
# Cookbook:: fry_chef
# Recipe:: network
#
# Copyright:: 2017, The Authors, All Rights Reserved.

ifconfig '10.0.1.2' do
  action [:enable,:add]
	device 'eno1'
  bootproto 'dhcp'
  onboot "yes"
end


ifconfig '10.0.1.3' do
  action [:enable,:add]
  device 'enp4s0'
  bootproto 'dhcp'
  onboot "yes"
end
