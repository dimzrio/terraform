module "vpc-dimzrio" {
    source = "./modules/network"

    project     = "dimzrio"
    region      = "asia-southeast2"
    zone        = "asia-southeast2-a"

    network = "dimzrio-network"
    subnetwork = "dimzrio-subnet"
    ip_cidr_range = "192.168.7.0/24"

    firewall_rules = [
        {
            name = "dimzrio-allow-http"
            protocol = "tcp"
            ports = ["80"]
            source_tags = ["nginx"]
            source_ranges = ["0.0.0.0/0"]
        },
        {
            name = "dimzrio-allow-ping"
            protocol = "icmp"
            ports = []
            source_tags = ["nginx"]
            source_ranges = ["0.0.0.0/0"]
        },
    ]
}

module "vpc-hideo" {
    source = "./modules/network"

    project     = "dimzrio"
    region      = "asia-southeast1"
    zone        = "asia-southeast1-a"

    network = "hideo-network"
    subnetwork = "hideo-subnet"
    ip_cidr_range = "192.168.9.0/24"

    firewall_rules = []
}

module "vm-nginx" {
    source = "./modules/instances"

    project     = "dimzrio"
    region      = "asia-southeast2"
    zone        = "asia-southeast2-a"

    name         = "nginx"
    machine_type = "e2-medium"
    tags = ["nginx"]
    image = "debian-cloud/debian-9"
    metadata_startup_script = [
        "apt update -y",
        "apt install -y nginx"
    ]

    network = "dimzrio-network"
    subnetwork = "dimzrio-subnet"
}