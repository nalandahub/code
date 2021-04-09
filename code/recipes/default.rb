#
# Cookbook:: code
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
package 'nginx' do
  action :install
end


service 'nginx' do
  action [ :enable, :start ]
end

##Copy the certificates as templates
template "/etc/ssl/certs/test/server.crt" do
  source "server.crt.erb"
end

template "/etc/ssl/certs/test/server.key" do
  source "server.key.erb"
end



#Create config for upstream & SSL
template "/etc/nginx/conf.d/custom.conf" do   
  source "custom.conf.erb"
  notifies :reload, "service[nginx]"
end

#Adding logrotation for nginx log files
template "/etc/logrotate.d/nginx" do
  source "logrotate-nginx.erb"
end

##Adding entry to crontab for every hour.
## This will add entry in crontab as below
## Chef Name: nginx_logrotation
#0 */1 * * * logrotate -df /etc/logrotate.d/nginx

cron 'nginx_logrotation' do
action :create
  minute '0'
  hour '*/1'
  command 'logrotate -df /etc/logrotate.d/nginx'
end


include_recipe 'code::pack'
