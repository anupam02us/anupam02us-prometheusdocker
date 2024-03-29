output "lb_ipv4" {
  description = "Load balancer IP address"
  value = hcloud_load_balancer.web_lb.ipv4
}

/*
output "web_servers_status" {
  value = {
    for server in hcloud_server.web :
    server.name => server.status
  }
}

output "web_servers_ips" {
  value = {
    for server in hcloud_server.web :
    server.name => server.ipv4_address
  }
}
*/

#status
output "web_servers_status" {
  value = {
    for server in hcloud_server.flutter :
    server.name => server.status
  }
}

#public ip address
output "web_servers_ips" {
  value = {
    for server in hcloud_server.flutter :
    server.name => server.ipv4_address
  }
}

output "python_backend" {
    value = hcloud_server.python_backend.ipv4_address
}

output "mariadb" { 
    value = hcloud_server.mariadb.ipv4_address
}

output "monitoring" {
    value = hcloud_server.grafana.ipv4_address
}


