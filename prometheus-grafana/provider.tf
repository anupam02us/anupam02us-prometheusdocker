terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.44.1"
    }
  }
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}


/*
variable "hcloud_token" {
    sensitive = true 
} 
*/

/*
#FOR DNS
terraform {
  required_providers {
    hetznerdns = {
      source = "timohirt/hetznerdns"
      version = "2.2.0"
    }
  }
}

provider "hetznerdns" {
  # Configuration options
}
*/


/*
### Modified 

terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.44.1"
    }
    hetznerdns = {
      source = "timohirt/hetznerdns"
      version = "2.2.0"
    }
  } 
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

provider "hetznerdns" {
  # Configuration options
}

*/