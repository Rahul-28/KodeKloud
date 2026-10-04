resource "aws_ebs_volume" "xfusion-volume" {
    availability_zone = var.az
    size = var.vol_size
    type = var.vol_type
    tags = {
        Name = var.nombre
    }
}

bob@iac-server ~/terraform via 💠 default ➜ terraform init
Initializing the backend...
Initializing provider plugins...
- Finding hashicorp/aws versions matching "5.91.0"...
- Installing hashicorp/aws v5.91.0...
- Installed hashicorp/aws v5.91.0 (signed by HashiCorp)
Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

 terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_ebs_volume.xfusion-volume will be created
  + resource "aws_ebs_volume" "xfusion-volume" {
      + arn               = (known after apply)
      + availability_zone = "us-east-1"
      + encrypted         = (known after apply)
      + final_snapshot    = false
      + id                = (known after apply)
      + iops              = (known after apply)
      + kms_key_id        = (known after apply)
      + size              = 2
      + snapshot_id       = (known after apply)
      + tags              = {
          + "Name" = "xfusion-volume"
        }
      + tags_all          = {
          + "Name" = "xfusion-volume"
        }
      + throughput        = (known after apply)
      + type              = "gp3"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

bob@iac-server ~/terraform via 💠 default ➜  terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_ebs_volume.xfusion-volume will be created
  + resource "aws_ebs_volume" "xfusion-volume" {
      + arn               = (known after apply)
      + availability_zone = "us-east-1"
      + encrypted         = (known after apply)
      + final_snapshot    = false
      + id                = (known after apply)
      + iops              = (known after apply)
      + kms_key_id        = (known after apply)
      + size              = 2
      + snapshot_id       = (known after apply)
      + tags              = {
          + "Name" = "xfusion-volume"
        }
      + tags_all          = {
          + "Name" = "xfusion-volume"
        }
      + throughput        = (known after apply)
      + type              = "gp3"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_ebs_volume.xfusion-volume: Creating...
aws_ebs_volume.xfusion-volume: Still creating... [10s elapsed]
aws_ebs_volume.xfusion-volume: Creation complete after 11s [id=vol-f5e1c7a1ee18b0fbe]
