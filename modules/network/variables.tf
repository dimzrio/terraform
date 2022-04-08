variable "project" {
    type = string
}

variable "region" {
    type = string
}

variable "zone" {
    type = string
}

variable "network" {
    type = string
    default = "default"
}

variable "subnetwork" {
    type = string
    default = null
}

variable "ip_cidr_range" {
    type = string
    default = null
}

variable "firewall_rules" {
    type = list(object({
        name = string
        protocol = string
        ports = list(string)
        source_tags = list(string)
        source_ranges = list(string)
    }))
}
