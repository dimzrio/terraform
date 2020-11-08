variable "iam_network_user" {
    type = list(object({
        subnetwork = list(string)
        iam_member = list(string)
    }))
}

variable "project" {
    type = string
    default = "dimzrio"
}

variable "region" {
    type = string
    default = "asia-southeast1"
}