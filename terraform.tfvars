# Provider
project     = "dimzrio"
region      = "asia-southeast2"
zone        = "asia-southeast2-a"

# Intances
name         = "nginx"
machine_type = "e2-medium"
tags = ["nginx"]
image = "debian-cloud/debian-9"
metadata_startup_script = [
    "apt update -y",
    "apt install -y nginx"
]

# Network
network = "dimzrio-network"
subnetwork = "dimzrio-subnet"
ip_cidr_range = "192.168.7.0/24"

# Firewall
firewall_rules = [
    {
        name = "allow-http"
        protocol = "tcp"
        ports = ["80"]
        source_tags = ["nginx"]
        source_ranges = ["0.0.0.0/0"]
    },
    {
        name = "allow-ping"
        protocol = "icmp"
        ports = []
        source_tags = ["nginx"]
        source_ranges = ["0.0.0.0/0"]
    },
]