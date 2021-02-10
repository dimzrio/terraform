###############
### Project ###
###############
project = "dimzrio"

###############
### Cluster ###
###############
cluster_name            = "dimzrio-labs"
region                  = "asia-southeast2"
zone                    = "asia-southeast2-a" 
version_prefix_master   = "1.17."
resource_labels         = {
                            "provisioner" = "terraform",
                            "app" = "kubernetes-cluster"
                        }

###############
### Network ###
###############
cluster_secondary_range_name    = "pods-address"
services_secondary_range_name   = "services-address"
master_ipv4_cidr_block          = "172.101.0.0/28"

#################
### Node Pool ###
#################
node_pools = [
    {
        name            = "dmz-labs-np-e2s2-1"
        preemptible     = "false"
        machine_type    = "e2-standard-2"
        node_count      = 2
        min_node_count  = 1
        max_node_count  = 10
        upgrade_max_surge       = 10 
        upgrade_max_unavailable = 0
        disk_size_gb    = 40
        disk_type       = "pd-standard" 
        labels          = {
                            "provisioner" = "terraform",
                            "machine" = "e2-standard-2"
                        }
        taint           = []
    }
]

###################
### VPC NETWORK ###
###################
vpc_name = "dimzrio-network"
vpc_subnet = [
  {
    subnet_name = "dimzrio-subnet-1"
    subnet_addr_cidr = "10.201.4.0/22"
    secondary_address = [
      {
        name = "pods-address"
        network_addr = "10.101.0.0/16"
      },
      {
        name = "services-address"
        network_addr = "10.201.2.0/23"
      },
    ]
  }
]