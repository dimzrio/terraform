project       = "kitabisa-infra"
region        = "asia-southeast1"
name          = "nginx"
zone          = "asia-southeast1-a"
image         = "centos-7-v20200811"
machine_type  = "f1-micro"
ip_cidr_range = "192.168.7.0/24"
ports         = ["80", "443", "22"]
