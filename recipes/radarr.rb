#
# Cookbook:: fry
# Recipe:: sonarr
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'docker'

docker_image 'linuxserver/radarr' do
  tag 'latest'
  notifies :redeploy, 'docker_container[radarr]'
  notifies :prune, 'docker_image_prune[prune_old_images]'
end

docker_container 'radarr' do
  repo 'linuxserver/radarr'
  tag 'latest'
  env ['PUID=1012', 'PGID=1111']
  tty true
  volumes ['/media/storage/Torrent/:/downloads', '/etc/letsencrypt/:/ssl', '/dev/rtc:/dev/trc:ro', '/media/storage/Movies/:/movies', '/media/storage/docker/radarr/:/config']
  port '8089:7878'
  restart_policy 'always'
end
