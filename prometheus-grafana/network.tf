#last updated
resource "hcloud_network" "hc_private" {
  name     = "hc_private"
  ip_range = var.ip_range
}

resource "hcloud_network_subnet" "hc_private_subnet" {
  network_id   = hcloud_network.hc_private.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = var.ip_range
}

resource "hcloud_server_network" "mariadb" {
  count     = var.instances
  server_id = hcloud_server.mariadb.id
  subnet_id = hcloud_network_subnet.hc_private_subnet.id
  ip        = "10.0.0.2"
}

resource "hcloud_server_network" "grafana" {
  count     = var.instances
  server_id = hcloud_server.grafana.id
  subnet_id = hcloud_network_subnet.hc_private_subnet.id
  ip        = "10.0.0.3"
}

resource "hcloud_server_network" "python_backend" {
  count     = var.instances
  server_id = hcloud_server.python_backend.id
  subnet_id = hcloud_network_subnet.hc_private_subnet.id
  ip        = "10.0.0.4"
}

resource "hcloud_server_network" "flutter" {
  count     = var.instances
  server_id = hcloud_server.flutter[count.index].id
  subnet_id = hcloud_network_subnet.hc_private_subnet.id
  ip        = "10.0.0.5"
}