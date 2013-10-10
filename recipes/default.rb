#
# Cookbook Name:: ioncube
# Recipe:: default
#
# Copyright 2012-2013, Jacques Marneweck
#
# All rights reserved - Do Not Redistribute
#

case node['ioncube']['php_version']
when "5.4" then phpapi = "20120301"
else
  Chef::Application.fatal!("You need to specify a PHP version")
end

remote_file "/var/tmp/ioncube_loaders_sun_x86.tar.bz2" do
  source "http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_sun_x86.tar.bz2"
  checksum "847938dc9ed22ca740bc2f9d461a937b80f70cd7962c7655938ba3fc93b65102"
end

execute "untar-ioncube-loaders" do
  command "gtar -jvxf ioncube_loaders_sun_x86.tar.bz2 ioncube/ioncube_loader_sun_#{node['ioncube']['php_version']}.so ioncube/ioncube_loader_sun_#{node['ioncube']['php_version']}_ts.so"
  cwd "/var/tmp"
end

execute "copy-ioncube-loaders" do
  command "cp -pr /var/tmp/ioncube/ioncube_loader_sun_#{node['ioncube']['php_version']}{,_ts}.so /opt/local/lib/php/#{phpapi}"
end
