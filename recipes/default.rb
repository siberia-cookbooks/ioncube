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
when "5.5" then phpapi = "20130620"
else
  Chef::Application.fatal!("You need to specify a PHP version")
end

remote_file "/var/tmp/ioncube_loaders_sun_x86.tar.bz2" do
  source "http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_sun_x86.tar.bz2"
  checksum "e7b0478a27047675decb06b066f95b8743fe4e2d9f57821a13323eeb92b42872"
end

execute "untar-ioncube-loaders" do
  command "gtar -jvxf ioncube_loaders_sun_x86.tar.bz2 ioncube/ioncube_loader_sun_#{node['ioncube']['php_version']}.so ioncube/ioncube_loader_sun_#{node['ioncube']['php_version']}_ts.so"
  cwd "/var/tmp"
end

execute "copy-ioncube-loaders" do
  command "cp -pr /var/tmp/ioncube/ioncube_loader_sun_#{node['ioncube']['php_version']}{,_ts}.so /opt/local/lib/php/#{phpapi}"
end
