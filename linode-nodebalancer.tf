resource "linode_nodebalancer" "Workshop-NodeBalancer" {
	label = "Workshop-NodeBalancer"
	region = var.region
	}

resource "linode_nodebalancer_config" "Workshop-NodeBalancer-Config" {
	nodebalancer_id = linode_nodebalancer.Workshop-NodeBalancer.id
	port=443
	protocol="https"
	check="connection"
	check_interval=5
	check_timeout=3
	check_attempts=2
	check_passive="true"
	ssl_cert=var.cert
	ssl_key=var.key
}

resource "linode_nodebalancer_node" "workshop-dcm-node" {
	nodebalancer_id=linode_nodebalancer.Workshop-NodeBalancer.id
	config_id=linode_nodebalancer_config.Workshop-NodeBalancer-Config.id
	label="dcm_node"
	address = "${linode_instance.Workshop-Micetro1.private_ip_address}:80"
	weight=100
	mode="accept"
	}
