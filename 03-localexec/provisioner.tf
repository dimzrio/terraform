resource "null_resource" "node_exporter" {
    triggers = {
        always_run = timestamp()
    }

    provisioner "local-exec" {
        command = <<EOT
            sleep 30;
            export ANSIBLE_HOST_KEY_CHECKING=False;
            echo "[gcp]\n$NAT_IP" > inventory.ini;
            ansible-playbook -u dimasriotantowi -i inventory.ini node-exporter.yml;
        EOT

        environment = {
            NAT_IP = google_compute_instance.compute-instance.network_interface[0].access_config[0].nat_ip
        }
    }
}