module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id                 = "kitabisa-stg"
  name                       = "kitabisa-stg-asia-se2-cluster-1"
  region                     = "asia-southeast2"
  regional                   = false
  zones                      = ["asia-southeast2-a"]
  network_project_id         = "kitabisa-infra"
  network                    = "kitabisa-shared-stg-vpc-1"
  subnetwork                 = "ktbs-k8s-asia-se2-stg-subnet-1"
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
      name                      = "kitabisa-np-stg-id"
      machine_type              = "e2-standard-4"
      node_locations            = ""
      min_count                 = 2
      max_count                 = 20
      local_ssd_count           = 0
      disk_size_gb              = 20
      disk_type                 = "pd-standard"
      image_type                = "COS"
      auto_repair               = true
      auto_upgrade              = true
      service_account           = "kubernetes@kitabisa-stg.iam.gserviceaccount.com"
      identity_namespace        = "kitabisa-stg.svc.id.goog"
      preemptible               = false
      initial_node_count        = 1
    },
  ]

  node_pools_oauth_scopes = {
    all = []

    kitabisa-np-stg-id-a-e2s4-app-s-1 = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}

    kitabisa-np-stg-id-a-e2s4-app-s-1 = {
        "env" = "stg",
        "squad" = "infra",
        "app" = "node-pool",
        "id" = "app-p-1",
        "provisioner" = "terraform",
        "machine" = "e2-standard-2"
    }
  }

  node_pools_metadata = {
    all = {}

    kitabisa-np-stg-id-a-e2s4-app-s-1 = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_taints = {
    all = []

    kitabisa-np-stg-id-a-e2s4-app-s-1 = [
      {
        "effect" = "NO_EXECUTE"
        "key"    = "node-role"
        "value"  = "app-standard"
      },
    ]
  }

  node_pools_tags = {
    all = []

    kitabisa-np-stg-id-a-e2s4-app-s-1 = [
      "kitabisa-np-stg-id-a-e2s4-app-s-1",
    ]
  }
}