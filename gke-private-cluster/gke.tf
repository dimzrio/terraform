module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id                 = "dimzrio-326915"
  name                       = "dimzrio-k8s-asia-se1-cluster-1"
  region                     = "asia-southeast1"
  regional                   = false
  zones                      = ["asia-southeast1-a"]
  network                    = "dimzrio-k8s-vpc-1"
  subnetwork                 = "dimzrio-k8s-subnet-1"
  ip_range_pods              = "pods-address"
  ip_range_services          = "services-address"
  http_load_balancing        = false
  horizontal_pod_autoscaling = true
  network_policy             = false
  enable_private_endpoint    = false
  enable_private_nodes       = true
  master_ipv4_cidr_block     = "172.109.0.0/28"

  node_pools = [
    {
      name                      = "dimzrio-nodepool-1"
      machine_type              = "e2-standard-2"
      node_locations            = ""
      min_count                 = 0
      max_count                 = 5
      local_ssd_count           = 0
      disk_size_gb              = 20
      disk_type                 = "pd-standard"
      image_type                = "COS"
      auto_repair               = true
      auto_upgrade              = true
      preemptible               = false
      initial_node_count        = 2
    },
  ]

  node_pools_oauth_scopes = {
    all = []

    dimzrio-nodepool-1 = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}
  }

  node_pools_metadata = {
    all = {}
  }

  node_pools_taints = {
    all = []
  }

  node_pools_tags = {
    all = []
  }

  depends_on = [
    module.subnet
  ]
}

// Deploy Nginx
// https://kubernetes.io/docs/concepts/workloads/controllers/deployment/