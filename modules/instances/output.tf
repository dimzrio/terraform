output "public_ip" {
    value = format("http://%s", google_compute_instance.vm.network_interface[0].access_config[0].nat_ip)
}