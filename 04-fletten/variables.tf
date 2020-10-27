variable "iam_network_user" {
    type = list(object({
        subnetwork = list(string)
        iam_member = list(string)
    }))
}

// variable "subnetwork" {
//     type = list(string)
// }

// variable "iam_member" {
//     type = list(string)
// }

variable "project" {
    type = string
    default = "kitabisa-infra"
}

variable "region" {
    type = string
    default = "asia-southeast1"
}