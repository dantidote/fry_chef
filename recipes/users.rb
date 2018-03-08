#
# Cookbook:: fry_chef
# Recipe:: users
#
# Copyright:: 2017, The Authors, All Rights Reserved.

user 'mediacenter' do
	uid '1001'
	manage_home true
end

user 'couchpotato' do
	uid '1003'
	manage_home true
end

user 'sab' do
	uid '1004'
	manage_home true
end

user 'deluge' do
	uid '1006'
	manage_home true
end

user 'nzbdrone' do
	uid '1005'
	manage_home true
end

user 'storj' do
	uid '1009'
	manage_home true
end

user 'qbittorrent' do
	uid '1011'
	manage_home true
end
