#
# Cookbook:: fry_chef
# Recipe:: unifi
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_repository 'unifi' do
  uri 'http://www.ubnt.com/downloads/unifi/debian'
  key '06E85760C0A52C50'
  keyserver 'keyserver.ubuntu.com'
  distribution 'stable'
  components ['ubiquiti']
end

package 'unifi'

service 'unifi' do
  action [:enable, :start]
end

file '/usr/lib/unifi/data/system.properties' do
  content 'unifi.https.port=8443'
  mode '644'
end
