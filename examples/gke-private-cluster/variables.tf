###############
### Project ###
###############
variable "project" { default = "" }
variable "region" { default = "us-central1" }
variable "zone" { default = "us-central1-a" }

###############
### Cluster ###
###############
variable "cluster_name" { default = "" }
variable "resource_labels" { default = {} }
variable "version_prefix_master" { default = "1.15." }
variable "initial_node_count" { default = 1 }

#################
### Node Pool ###
#################
variable "node_pools" {
    type = list(object({
            name = string
            node_count = number
            preemptible = bool
            machine_type = string
            min_node_count = number
            max_node_count = number
            upgrade_max_surge = number
            upgrade_max_unavailable = number
            disk_size_gb = number
            disk_type = string
            labels = map(string)
            taint = list(map(string))
        }))

    default = [
        {
            name = ""
            node_count = 0
            preemptible = false
            machine_type = ""
            min_node_count = 0
            max_node_count = 3
            upgrade_max_surge = 1
            upgrade_max_unavailable = 0
            disk_size_gb = 20
            disk_type = "pd-standard"
            labels = {}
            taint = []
        }
    ]
}

###############
### Network ###
###############
variable "vpc_name" { default = "" }
variable "cluster_secondary_range_name" { default = "" }
variable "services_secondary_range_name" { default = "" }
variable "master_ipv4_cidr_block" { default = "" }
variable "routing_mode" { default = "REGIONAL" }
variable "secondary_address_enabled" { default = false }
variable "vpc_subnet" {
    type = list(object({
            subnet_name = string
            subnet_addr_cidr = string
            secondary_address = list(map(string))
        }))

    default = [
        {
            subnet_name = ""
            subnet_addr_cidr = ""
            secondary_address = []
        }
    ]
}