#
# Cookbook:: fry_chef
# Recipe:: unifi
#
# Copyright:: 2018, The Authors, All Rights Reserved.

docker_image 'jacobalberty/unifi'

docker_container 'unifi' do
  repo 'jacobalberty/unifi'
  port ['8443:8443','3478:3478/udp','10001:10001/udp','8080:8080','8843:8843','8880:8880','6789:6789']
  env 'TZ=America/Detroit'
  volumes ['/media/storage/docker/unifi:/unifi']
  memory '1073741824'
end
