variable "project" {
    type = string
}

variable "region" {
    type = string
}

variable "zone" {
    type = string
}

variable "name" {
    type = string
}

variable "machine_type" {
    type = string
}

variable "tags" {
    type = list(string)
}

variable "image" {
    type = string
}

variable "metadata_startup_script" {
    type = list(string)
}

variable "network" {
    type = string
    default = "default"
}

variable "subnetwork" {
    type = string
    default = null
}
