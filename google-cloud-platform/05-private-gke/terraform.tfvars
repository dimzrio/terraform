###############
### Project ###
###############
credentials = "/home/rio/Downloads/dimzrio-8563dd31ddda.json"
project     = "dimzrio"

###############
### Cluster ###
###############
cluster_name = "dimzrio-k8s"
resource_labels = {
    "env" = "dev",
    "squad" = "infra"
}

###############
### Network ###
###############
network  = "dimzrio-network"
subnetwork = "dimzrio-subnet"
cluster_secondary_range_name = "dimzrio-pods"
services_secondary_range_name = "dimzrio-svc"
master_ipv4_cidr_block = "172.16.7.0/28"

#################
### Node Pool ###
#################
labels = {
    "env" = "dev",
    "squad" = "infra",
    "app" = "node-pool"
}