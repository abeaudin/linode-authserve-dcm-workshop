resource "linode_firewall" "Workshop-firewall" {
  label = "Workshop-firewall"

  inbound {
    label    = "allow-ssh"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = [var.myipaddress]
    ipv6     = []
  }

  
  inbound_policy = "ACCEPT"
  outbound_policy="ACCEPT"
  }
  
  resource "linode_firewall_device" "Workshop-AuthServe1-device" {
	firewall_id = linode_firewall.Workshop-firewall.id
	entity_id = linode_instance.Workshop-AuthServe1.id
	}
	
  resource "linode_firewall_device" "Workshop-AuthServe2-device" {
	firewall_id = linode_firewall.Workshop-firewall.id
	entity_id = linode_instance.Workshop-AuthServe2.id
	}
	
  resource "linode_firewall_device" "Workshop-Micetro1-device" {
	firewall_id = linode_firewall.Workshop-firewall.id
	entity_id = linode_instance.Workshop-Micetro1.id
	}