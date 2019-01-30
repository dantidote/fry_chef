#
# Cookbook:: fry
# Recipe:: grafana
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'docker'

node.default['grafana']['local_dir'] = '/home/dan/docker/grafana'

user 'grafana' do
  uid '472'
end

directory node['grafana']['local_dir'] do
  recursive true
  user 'grafana'
end

docker_image 'grafana/grafana' do
  tag 'latest'
  notifies :redeploy, 'docker_container[grafana]'
  notifies :prune, 'docker_image_prune[prune_old_images]'
end

docker_container 'grafana' do
  repo 'grafana/grafana'
  volumes ["#{node['grafana']['local_dir']}:/var/lib/grafana"]
  port '3000:3000'
  restart_policy 'always'
  notifies :prune, 'docker_image_prune[prune_old_images]'
end
