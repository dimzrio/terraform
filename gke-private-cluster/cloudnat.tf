module "cloud-nat" {
  source     = "terraform-google-modules/cloud-nat/google"
  version    = "~> 1.2"
  project_id = "dimzrio-326915"
  region     = "asia-southeast1"
  name       = "dimzrio-k8s-asia-se1-nat-1"
  router     = "dimzrio-k8s-asia-se1-router-1"
  create_router = true
  network       = "dimzrio-k8s-vpc-1"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  depends_on = [ module.gke ] 
}