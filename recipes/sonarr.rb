#
# Cookbook:: fry
# Recipe:: sonarr
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'docker'

docker_image 'dantidote/sonarr' do
  tag 'latest'
  source '/root/docker_sonarr'
  action :build_if_missing
end

docker_image 'linuxserver/sonarr'


docker_container 'sonarr' do
  repo 'linuxserver/sonarr'
  tag 'latest'
  env ['PUID=1005', 'PGID=1111']
  tty true
  volumes ['/media/storage/Torrent/:/downloads', '/etc/letsencrypt/:/ssl', '/dev/rtc:/dev/trc:ro', '/media/storage/TV/:/tv', '/home/nzbdrone/.config/NzbDrone/:/config']
  port '8081:8081'
  restart_policy 'always'
end