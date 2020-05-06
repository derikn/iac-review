resource "google_compute_instance" "raddit" {
    name            = "raddit-instance"
    machine_type    = "f1-micro"
    zone            = "us-west1-a"

    # boot disk spec
    boot_disk {
        initialize_params {
            image = "raddit-base" //original packer image
        }
    }

    # networks to attach to VM
    network_interface {
        network = "default"
        access_config {} // use the ephmeral public ip
    }
}

resource "google_compute_project_metadata" "raddit" {
    metadata = {
        ssh-keys = "raddit-user:${file("~/.ssh/raddit-user.pub")}" // path to ssh key file
        }
    }

resource "google_compute_firewall" "raddit" {
    name    = "allow-raddit-tcp-9292"
    network = "default"
    allow {
        protocol = "tcp"
        ports    = ["9292"]
     }
    source_ranges = ["0.0.0.0/0"]
}

output "raddit_public_ip" {
  value = "${google_compute_instance.raddit.network_interface.0.access_config.0.nat_ip}"
}