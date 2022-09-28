terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.29.2"
    }
  }
}

provider "linode" {
  token = var.token
}

# Create the keys to access the Object Storage files (ansp install and license file)
resource "linode_object_storage_key" "bucket-keys" {
    label = "mabel"
    bucket_access {
		bucket_name = var.bucket_name
		cluster = var.cluster
		permissions = "read_only"
	}
}

output "stackscript_data" {
	value = nonsensitive( linode_instance.Workshop-AuthServe1.stackscript_data.bucket_region)
}
resource "linode_instance" "Workshop-AuthServe1" {
    image = "linode/ubuntu20.04"
    label = "Workshop-AuthServe1"
    group = "Terraform"
    region = var.region
    type = "g6-standard-1"
    authorized_keys = [var.authorized_keys]
    root_pass = var.root_pass
	interface {
		purpose = "public"
	}
	interface {
		purpose = "vlan"
		label = var.vlan
		ipam_address = "10.0.0.1/24"
	}	
	stackscript_id = 1065431
	stackscript_data = { 
		"access_key" = linode_object_storage_key.bucket-keys.access_key
		"secret_key" = linode_object_storage_key.bucket-keys.secret_key
		"bucket_region" = var.cluster
		"bucket" = var.bucket_name
	}

}



resource "linode_instance" "Workshop-AuthServe2" {
    image = "linode/ubuntu20.04"
    label = "Workshop-AuthServe2"
    group = "Terraform"
    region = var.region
    type = "g6-standard-1"
    authorized_keys = [var.authorized_keys]
    root_pass = var.root_pass
	interface {
		purpose = "public"
	}
	interface {
		purpose = "vlan"
		label = var.vlan
		ipam_address = "10.0.0.2/24"
	}
	stackscript_id = 1065431
	stackscript_data = { 
	    "access_key" = linode_object_storage_key.bucket-keys.access_key
		"secret_key" = linode_object_storage_key.bucket-keys.secret_key
		"bucket_region" = var.cluster
		"bucket" = var.bucket_name
	}

}

resource "linode_instance" "Workshop-Micetro1" {
    image = "linode/ubuntu20.04"
	label = "Workshop-Micetro1"
    group = "Terraform"
    region = var.region
    type = "g6-standard-1"
    authorized_keys = [var.authorized_keys]
    root_pass = var.root_pass
	private_ip = true
	interface {
		purpose = "public"
	}
    interface {
		purpose = "vlan"
		label = var.vlan
		ipam_address = "10.0.0.3/24"
    }
	stackscript_id = 1066205
 	stackscript_data = { 
	    "access_key" = linode_object_storage_key.bucket-keys.access_key
		"secret_key" = linode_object_storage_key.bucket-keys.secret_key
	}

}



	
