#
# Cookbook:: fry
# Recipe:: sonarr
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'docker'

docker_image 'linuxserver/sonarr' do
  tag 'latest'
  notifies :redeploy, 'docker_container[sonarr]'
  notifies :prune, 'docker_image_prune[prune_old_images]'
end

docker_container 'sonarr' do
  repo 'linuxserver/sonarr'
  tag 'latest'
  env ['PUID=1005', 'PGID=1111']
  tty true
  volumes ['/media/storage/Torrent/:/downloads', '/etc/letsencrypt/:/ssl', '/dev/rtc:/dev/trc:ro', '/media/storage/TV/:/tv', '/home/nzbdrone/.config/NzbDrone/:/config']
  port '8081:8081'
  restart_policy 'always'
end
