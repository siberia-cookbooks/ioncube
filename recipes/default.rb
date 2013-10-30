#
# Cookbook Name:: ioncube
# Recipe:: default
#
# Copyright 2012-2013, Jacques Marneweck
#
# All rights reserved - Do Not Redistribute
#

case node['ioncube']['php_version']
when "5.3" then phpapi = "20090626"
when "5.4" then phpapi = "20120301"
else
  Chef::Application.fatal!("You need to specify a PHP version")
end

remote_file "/var/tmp/ioncube_loaders_sun_x86.tar.bz2" do
  source "http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_sun_x86.tar.bz2"
  checksum "294f9a6b2555c04b31730c9f6cf2bf10f23fc0e46cb49e8b3147f75f867e3021"
end

execute "untar-ioncube-loaders" do
  command "gtar -jvxf ioncube_loaders_sun_x86.tar.bz2 ioncube/ioncube_loader_sun_#{node['ioncube']['php_version']}.so ioncube/ioncube_loader_sun_#{node['ioncube']['php_version']}_ts.so"
  cwd "/var/tmp"
end

execute "copy-ioncube-loaders" do
  command "cp -pr /var/tmp/ioncube/ioncube_loader_sun_#{node['ioncube']['php_version']}{,_ts}.so /opt/local/lib/php/#{phpapi}"
end
