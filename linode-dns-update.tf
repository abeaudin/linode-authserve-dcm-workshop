resource "linode_domain" "workshop_domain" {
    type = "master"
    domain = var.domainname
    soa_email = "admin@${var.domainname}"
}

resource "linode_domain_record" "workshop_domain_record" {
    domain_id = linode_domain.workshop_domain.id
    name = "dcm"
    record_type = "A"
	ttl_sec=60
    target = linode_nodebalancer.Workshop-NodeBalancer.ipv4
}