#
# Cookbook:: fry
# Recipe:: sab
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'docker'

docker_image 'dantidote/sab' do
  tag 'latest'
  source '/media/storage/Source/docker_sab'
  action :build_if_missing
end

docker_container 'sab' do
  repo 'dantidote/sab'
  user '1004:1111'
  volumes ['/media/storage/Torrent/:/downloads', '/etc/letsencrypt/:/ssl', '/media/storage/docker/sab/:/config', '/media/storage/Torrent/Incomplete/:/incomplete']
  port '8088:8088'
  restart_policy 'always'
end
