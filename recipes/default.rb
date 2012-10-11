#
# Cookbook Name:: ioncube
# Recipe:: default
#
# Copyright 2012, Jacques Marneweck
#
# All rights reserved - Do Not Redistribute
#

remote_file "/var/tmp/ioncube_loaders_sun_x86.tar.bz2" do
  source "http://downloads2.ioncube.com/loader_downloads/ioncube_loaders_sun_x86.tar.bz2"
end

execute "untar-ioncube-loaders" do
  command "gtar -jvxf ioncube_loaders_sun_x86.tar.bz2 ioncube/ioncube_loader_sun_5.4.so ioncube/ioncube_loader_sun_5.4_ts.so"
  cwd "/var/tmp"
end

execute "copy-ioncube-loaders" do
  command "cp -pr /var/tmp/ioncube/ioncube_loader_sun_5.4{,_ts}.so /opt/local/lib/php/20120301"
end
