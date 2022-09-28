# Linode Authserve DCM Workshop
# About
Package of template files, examples, and illustrations for the Linode Authserve DCM Workshop Exercise.
This workshop provides examples of how to configure:
- Linodes
- Private IPs
- VLANs
- Firewalls, Rules, Nodes
- Nodebalancers, configs, targets
- Domains and DNS Records
- StackScripts
- ObjectStorage access from Terraform
# Contents
## Template Files
- Sample Terraform files for deploying an AuthServe Multimaster pair and a DCM instance on Linode.
- StackScripts

## Prerequisites
- Linode Account
- Object Storage Bucket
- Binaries for Authserve and DCM loaded into the Object Storage Bucket
- Licenses for Authserve and DCM loaded into the Object Storage Bucket
- Domain name (optional)
- Self signed certs (optional if you want a nodebalancer with SSL Termination)

### Exercise Diagram
![image](https://user-images.githubusercontent.com/7717493/192870451-33937f5f-3edf-4326-951b-0cfe23a85fbc.png)

![image](https://user-images.githubusercontent.com/7717493/192870644-2b460da8-0fdb-47a1-8406-c2671eb7db48.png)

![image](https://user-images.githubusercontent.com/7717493/192870831-2f66fa1d-911a-455a-9ea4-47f07f20e9c8.png)


## Step By Step Instructions
### Overview
The scenario is written to approximate deployment of a resilient hidden multimaster Authoritative DNS service with secondary servers in Akamai's EdgeDNS and Linode Domains.

The workshop scenario builds the following components and steps-

1. A Secure Shell Linode (provisioned via the Linode Cloud Manager GUI) to serve as the command console for the environment setup.

2. Installing developer tools on the Secure Shell (git, terraform, and kubectl) for use in environment setup.

3. Three Linodes (ubuntu 20.04), provisioned via terraform. Two for AuthServe, one for DCM. 

4. Supporting linode objects, provisioned via Terraform include:
- Nodebalancer for SSL Termination
- Firewall permitting only ports 22,443 inbound
- Object Storage Keys permitting access from the Linodes to the binaries on the Object Storage Bucket
- Domain and DNS Record



