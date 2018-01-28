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

#service 'unifi' do
#  action [:enable, :start]
#end

template '/usr/lib/unifi/data/system.properties' do
  source 'unifi.erb'
  mode '644'
end


docker_image 'jacobalberty/unifi'

docker_container 'unifi' do
  repo 'jacobalberty/unifi'
  port ['8443:8443','3478:3478/udp','10001:10001/udp','8080:8080','8843:8843','8880:8880','6789:6789']
  env 'TZ=America/Detroit'
  volumes ['/media/storage/docker/unifi:/unifi']
end
