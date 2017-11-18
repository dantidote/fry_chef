#
# Cookbook:: fry
# Recipe:: graphite
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'docker'

docker_container 'graphite' do
  repo 'sitespeedio/graphite'
  volumes ['/home/dan/docker/graphite/storage/whisper:/opt/graphite/storage/whisper',
           '/media/storage/docker/graphite/storage-schemas.conf:/opt/graphite/conf/storage-schemas.conf']
  port ['8085:80', '2003:2003', '2003:2003/udp']
  restart_policy 'always'
end
