
node.default['sysctl'] = {}

node['sysctl'].each_pair do |k,v|
 sysctl k do
   key k
   value v
 end
end
