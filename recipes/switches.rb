#
# Cookbook:: fry_chef
# Recipe:: switches
#
# Copyright:: 2018, The Authors, All Rights Reserved.

cron '10g temperature' do
  command '/bin/bash -c \'/bin/echo switch.lb6m.temp $(/root/switch2.sh | /bin/grep -e "^Temp (Celsius)." | /usr/bin/awk "{print \$3}" | /bin/sed "s/\r//") $(date +\%s) | nc -q0 10.0.1.4 2003\''
  minute "*/1"
end

cron '1g temperature' do
  command '/bin/bash -c \'/bin/echo switch.lb4m.temp $(/root/switch.sh | /bin/grep -e "^Temp (Celsius)." | /usr/bin/awk "{print \$3}" | /bin/sed "s/\r//") $(date +\%s) | nc -q0 10.0.1.4 2003\''
  minute "*/1"
end
