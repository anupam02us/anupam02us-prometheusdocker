# anupam02us-prometheusdocker
Created resources:--
1)	Frontend-server	--- Contain flutter app
2)	Backend-server		--- Contain python api
3)	Database server 	--- Contain mariadb database
4)	Monitoring Server 	--- Contain Prometheus, Grafana, node exporter, alert manager
5)	Load Balancer   ---target server “Frontend-server, port: http:80 -> 80
6)	Volume                               ----- It is attached with Database Server – 20 Gb
7)	Firewall name – monitoring 		--- allow 9093, 3000, ICMP, 9100, 22
8)	Firewall name -- frontend-server 	--- allow 9093, ICMP, 9100, 80, 22, 
9)	Firewall name – database   		--- allow 9093, ICMP, 9100, 3306
10)	Firewall name -- backend-server 	---- allow 9093, ICMP, 9100, 22,80
11)	Network resource subnet “hc_private” --- 10.0.0.0/24
Assign static private ip address for monitor server with Prometheus, Grafana.
12)	Network ip assign for each server – for database server fixed ip 10.0.0.2
13)	Network ip assign for each server – for monitoring server fixed ip 10.0.0.3
14)	Network ip assign for each server – for backend server fixed ip 10.0.0.4
15)	Network ip assign for each server – for frontend-server server fixed ip 10.0.0.5
16)	Create ssh key to access all server. Added public key tf_hetzner.pub.pub --- >>> public key

All application install in serves with cloud-config.

Create ssh key :---
Use this command :
ssh-keygen -f  ~/.ssh/ tf_hetzner -t rsa -b 4096 -N ''
private_key_rsa  tf_hetzner.pub  tf_hetzner.pub.pub
tf_hetzner.pub.pub --- >>> public key - This key added in the file ssh.tf file.
tf_hetzner.pub    private key (another same file private_key_rsa)
And also added in all .yml file (it will different, copy from .pub.pub file)
    ssh_authorized_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBhwpoRosPVZRWo0LBJTvn5Gdu0EfaJpiblHIvsCdWdQ
Create devops users in all server with .yml file.

To connect:
SSH agent forwarding in ubuntu:--
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/your_private_key
ssh -A devops@remote_server_ip(public ip)

#sudo nano /etc/ssh/sshd_config
 AllowAgentForwarding yes
 sudo service sshd restart
  sudo systemctl restart sshd

Cloud Api Token :-- it is require to run apply terraform plan, It will different for each hetzner cloud account. Create account in hetzner could account and create this api first.
3PlrvUxlgsgrgSBuoffds4hAJt4Cpilxz2h4ddj2aD4izwBnCO2BP73JS9y

Code uploaded in the below link:--
git.rishabhsoft.com

Cloud-Practice / Workspaces / docker_for_prometheus · GitLab (rishabhsoft.com)

https://git.rishabhsoft.com/cloud-practice/workspaces/docker_for_prometheus.git
Cloud-Practice / Workspaces / anupam · GitLab (rishabhsoft.com)

Grafana password:--
GF_SECURITY_ADMIN_USER=admin
GF_SECURITY_ADMIN_PASSWORD=foobar
GF_USERS_ALLOW_SIGN_UP=false

Access promethous with http://public ip of monitering server:9090
Access Grafana with : http://public ip of monitering server:3000
Email alert get form alert manager and Grafana. Form alert manager get only email alert, but Grafana alert get email alert and graphical representation also.


Grafana configure and also configure alert for getting email alert: --
Add data source :--- Click on “Add your first data source”  select “promethous” 
 
As it is Prometheus, Grafana configure in docker, so ip address or localhost will not work. Need to put as below picture. You can check below link.
Go solution form this link:-- https://github.com/grafana/grafana/issues/46434
http://prometheus:9090
 
 
add 1st dashboard:-- 
-----------------------------
https://grafana.com/grafana/dashboards/
import dash board and select datasource “prometheus-1”

select  Node Exporter Full - ID: 1860
Dashboard:-- create folder “traning”
