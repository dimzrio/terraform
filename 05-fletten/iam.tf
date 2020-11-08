locals {
    network_user = flatten([
        for index in var.iam_network_user : [
            for subnetwork in index.subnetwork : [
                for member in index.iam_member : {
                    subnetwork = subnetwork
                    member = member
                }
            ]
        ]
    ])
}

resource "google_compute_subnetwork_iam_member" "network_user_role" {
  count      = length(local.network_user)
  project    = var.project
  region     = var.region
  subnetwork = local.network_user[count.index].subnetwork
  role       = "roles/compute.networkUser"
  member     = local.network_user[count.index].member
}