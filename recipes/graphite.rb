#
# Cookbook:: fry
# Recipe:: graphite
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'docker'

node.default['graphite']['whisper_dir'] = '/home/dan/docker/graphite/storage/whisper'
node.default['graphite']['conf_dir'] = '/media/storage/docker/graphite'
node.default['graphite']['build_dir'] = '/tmp/graphitebuild'

directory node['graphite']['whisper_dir'] do
  recursive true
end

directory node['graphite']['conf_dir'] do
  recursive true
end

if node['hostnamectl']['architecture'] == 'arm'

  git node['graphite']['build_dir'] do
    repository 'https://github.com/dantidote/docker-graphite-statsd.git'
    notifies :build, 'docker_image[graphiteapp/graphite-statsd]'
  end

  docker_image 'graphiteapp/graphite-statsd' do
    tag 'latest'
    source node['graphite']['build_dir']
    action :build_if_missing
    read_timeout 480
    notifies :prune, 'docker_image_prune[prune_old_images]'
    notifies :redeploy, 'docker_container[graphite]'
  end

else

  docker_image 'graphiteapp/graphite-statsd' do
    tag 'latest'
    notifies :redeploy, 'docker_container[graphite]'
    notifies :prune, 'docker_image_prune[prune_old_images]'
  end

end

docker_container 'graphite' do
  repo 'graphiteapp/graphite-statsd'
  volumes ["#{node['graphite']['whisper_dir']}:/opt/graphite/storage/whisper",
           "#{node['graphite']['conf_dir']}:/opt/graphite/conf"]
  port ['8085:80', '2003-2004:2003-2004', '2023-2024:2023-2024', '8125:8125/udp', '8126:8126']
  restart_policy 'always'
  notifies :prune, 'docker_image_prune[prune_old_images]'
end
