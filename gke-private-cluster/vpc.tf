module "vpc" {
    source  = "terraform-google-modules/network/google//modules/vpc"
    version = "3.4.0"

    project_id   = "dimzrio-326915"
    network_name = "dimzrio-k8s-vpc-1"

    shared_vpc_host = false
}

module "subnet" {
    source  = "terraform-google-modules/network/google//modules/subnets"
    version = "3.4.0"

    project_id   = "dimzrio-326915"
    network_name = "dimzrio-k8s-vpc-1"

    subnets = [
        {
            subnet_name           = "dimzrio-k8s-subnet-1"
            subnet_ip             = "192.168.7.0/26"
            subnet_region         = "asia-southeast1"
        }
    ]

    secondary_ranges = {
        dimzrio-k8s-subnet-1 = [
            {
                range_name    = "pods-address"
                ip_cidr_range = "10.7.0.0/20"
            },
            {
                range_name    = "services-address"
                ip_cidr_range = "10.7.16.0/23"
            }
        ]
    }

    depends_on = [ module.vpc ]
}