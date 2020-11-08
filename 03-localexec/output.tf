output "endpoint" {
  value = format("http://%s:9100/metrics", google_compute_instance.compute-instance.network_interface[0].access_config[0].nat_ip)
}