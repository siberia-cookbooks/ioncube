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
