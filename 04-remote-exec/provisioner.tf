resource "null_resource" "provisioner" {
    triggers = {
        always_run = timestamp()
    }

    connection {
        host    = google_compute_instance.compute-instance.network_interface[0].access_config[0].nat_ip
        type    = "ssh"
        user    = "dimasriotantowi"
        private_key = file("/Users/dimasriotantowi/.ssh/id_rsa")
    }

    provisioner "remote-exec" {
        inline = ["echo 'Hello World' > hello.txt"]
    }

}
