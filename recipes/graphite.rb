#
# Cookbook:: fry
# Recipe:: graphite
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'docker'

docker_container 'graphite' do
  repo 'graphiteapp/graphite-statsd'
  volumes ['/home/dan/docker/graphite/storage/whisper:/opt/graphite/storage/whisper',
           '/media/storage/docker/graphite/storage-schemas.conf:/opt/graphite/conf/storage-schemas.conf']
  port ['8085:80', '2003-2004:2003-2004', '2023-2024:2023-2024', '8125:8125/udp', '8126:8126']
  restart_policy 'always'
  notifies :prune, 'docker_image_prune[prune_old_images]'
end
