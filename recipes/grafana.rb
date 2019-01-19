#
# Cookbook:: fry
# Recipe:: grafana
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'docker'

docker_container 'grafana' do
  repo 'grafana/grafana'
  volumes ['/home/dan/docker/grafana/:/var/lib/grafana']
  port '3000:3000'
  restart_policy 'always'
  notifies :prune, 'docker_image_prune[prune_old_images]'
end
