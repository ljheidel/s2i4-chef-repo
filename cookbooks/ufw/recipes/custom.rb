cookbook_file '/usr/local/sbin/ufw-by-hostname.sh' do
  source 'ufw-by-hostname.sh'
  owner 'root'
  group 'root'
  mode '0700'
  action :create
end

cookbook_file '/etc/cron.d/ufw-cron' do
  source 'ufw-cron'
  owner 'root'
  group 'root'
  mode  '0644'
  action :create
end

template '/usr/local/sbin/do-ufw-by-hostname.sh' do
  source 'do-ufw-by-hostname.sh.erb'
  owner 'root'
  group 'root'
  mode '0700'
  variables ({
    :hosts => node[:firewall][:allow_by_hostname]
  })
end

bash 'start_by_hostname_rules' do
  code <<-EOH
    /usr/local/sbin/do-ufw-by-hostname.sh
  EOH
end
