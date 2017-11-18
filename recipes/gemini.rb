#
# Cookbook:: fry
# Recipe:: gemini
#
# Copyright:: 2017, The Authors, All Rights Reserved.

cron 'gemini' do
  command '/media/storage/Source/tothemoon/gemini.pl'
  user 'root'
  hour '5'
  minute '59'
end
