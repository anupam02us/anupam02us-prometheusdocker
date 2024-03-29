#Need to add volume only in mariadb
/*
resource "hcloud_volume" "web_server_volume" {
  name     = "mariadb-volume"
  size     = var.disk_size
  location = var.location
  format   = "xfs"
}
*/

resource "hcloud_volume" "web_server_volume" {
  name     = "mariadb-volume"
  size     = var.disk_size
  #location = var.location
  server_id = hcloud_server.mariadb.id
  automount = true
  format   = "ext4"
}

/*
resource "hcloud_volume_attachment" "web_vol_attachment" {
  count     = var.instances
  volume_id = hcloud_volume.web_server_volume.id
  server_id = hcloud_server.mariadb.id
  automount = true
}
*/