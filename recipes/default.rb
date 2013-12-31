#
# Cookbook Name:: wonderstuff
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
package 'lighttpd'

service 'lighttpd' do
    action [:enable, :start]
end

cookbook_file '/var/www/index.html' do
    source 'wonderstuff.html'
    owner 'www-data'
    group 'www-data'
end
