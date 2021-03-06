# terraform-me-that/aws-ec2

This directory holds a [Terraform](https://www.terraform.io/docs/) module that provisions an [AWS](http://aws.amazon.com/) EC2 instance (ubuntu LTS 20.04) in your favorite AWS region (default us-east-1).
The newly provisioned vm is fully patched and accessible from your public IP by ssh using a generated ssh keypair

prereqsuites: 
* aws credential (API token) is preconfigured and verified to have priviledges to manage infrastructure such as vpc, subnet, igw, sg, and ec2.  
* you understand and can follow typical terraform workflow (init, plan, apply, state/output, destroy). [Hashicorp](https://www.hashicorp.com/) and AWS own the providers code, etc.

warning:
* you may incur cost with cloud providers and other service providers.
* no warranty whatsoever. This is what I pieced together from my own learning exercises, in hope the integration pattern proves equally illustrating and useful to you.

What does this do?
* generate a ssh keypair and save private key into a file named "id_terra", and set it up as a new aws keypair
* retrieve your public IP via API, to be used src CIDR for ssh connection inbound to your vm
* identify the latest Ubuntu LTS 20.04 x64 AMI by [Canonical](https://canonical.com/) 
* set up infrastructure (vpc, subnet, igw, sg)
* spin up 1 ec2 instance, ondemand or spot (default)
  * find spot price real-time, to be used to bid for a spot instance (default)
  * source local file "user_data.raw" as base64-encoded userdata to cloud-init the instance. 

Example:
> terraform apply -var 'ec2_market_type=demand'  
> terraform apply -var 'ec2_market_type=spot'
