#
# Cookbook:: fry_chef
# Recipe:: couchpotato
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'docker'

docker_image 'linuxserver/couchpotato' do
  tag 'latest'
  notifies :redeploy, 'docker_container[couchpotato]'
end

docker_container 'couchpotato' do
  repo 'linuxserver/couchpotato'
  tag 'latest'
  env ['PUID=1003', 'PGID=1111', 'TZ=America/Detroit']
  volumes ['/media/storage/Torrent/:/downloads', '/etc/letsencrypt/:/ssl', '/media/storage/Movies/:/movies', '/home/couchpotato/.couchpotato:/config']
  port '8082:8082'
  restart_policy 'always'
end
