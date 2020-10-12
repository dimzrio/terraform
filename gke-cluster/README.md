This terraform file uses for provisioning private gke cluster.

You can put custom configuration into terraform.tfvars.
For default variables, please kindly read variables.tf.

Please define env variable with name GOOGLE_CREDENTIALS and GOOGLE_BACKEND_CREDENTIALS:

Note:

GOOGLE_CREDENTIALS: uses for credential to gcp project.

GOOGLE_BACKEND_CREDENTIALS: uses for credential to store terraform-state into gcs bucket. (default: kitabisa-infra)


How to run:

Create workspaces development.
~~~~
$ export GOOGLE_BACKEND_CREDENTIALS=`cat /Users/example/kitabisa-infra-sa.json`
$ export GOOGLE_CREDENTIALS=`cat /Users/example/kitabisa-dev-sa.json`
$ terraform workspace new kitabisa-dev
$ terraform init
$ terraform { plan, apply, destroy } -var-file=kitabisa-dev.tfvars
~~~~