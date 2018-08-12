#
# Cookbook:: fry_chef
# Recipe:: network
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# ifconfig '10.0.1.3' do
#   action [:enable]
# 	device 'eno1'
#   mask "255.255.255.0"
#   onboot "yes"
# end
#
#
# ifconfig '10.0.1.180' do
#   action [:add, :enable]
#   device 'enp2s0'
#   mtu '9000'
#   onboot "yes"
# end
#
#
# execute 'route metric' do
#   command 'route add -net default gw 10.0.1.1 dev eno1 metric 1; route add -net 10.0.1.0/24 dev eno1 metric 1; exit 0'
# end
#
# execute 'route metric' do
#   command 'route add -net default gw 10.0.1.1 dev enp2s0'
# end


network_interface 'eth0' do
  bootproto 'static'
  address '10.0.1.3'
  netmask '255.255.255.0'
  gateway '10.0.1.1'
  metric 1
  mtu 9000
end

network_interface 'eth1' do
  bootproto 'static'
  address '10.0.1.180'
  netmask '255.255.255.0'
  metric 0
  mtu 9000
  post_up ['route add -net default gw 10.0.1.1 dev eth1', 'route add -net 10.0.1.0/24 dev eth1']
  pre_down ['route del -net default gw 10.0.1.1 dev eth1', 'route del -net 10.0.1.0/24 dev eth1']
end
