resource "aws_ebs_volume" "k8s_volume" {
  availability_zone = "us-east-1a"
  size              = 5
  type              = "gp2"

  tags = {
    Name        = "xfusion-vol"
  }
}

resource "aws_ebs_snapshot" "xfusion-vol-ss" {
  description = "Xfusion Snapshot"
  volume_id = aws_ebs_volume.k8s_volume.id
  tags = {
    Name = "xfusion-vol-ss"
  }
}


bob@iac-server ~/terraform via 💠 default ➜  terraform init
Initializing the backend...
Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v5.91.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.


bob@iac-server ~/terraform via 💠 default ➜  terraform plan
aws_ebs_volume.k8s_volume: Refreshing state... [id=vol-27383341a9130f24d]

Terraform used the selected providers to generate the following
execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_ebs_snapshot.xfusion-vol-ss will be created
  + resource "aws_ebs_snapshot" "xfusion-vol-ss" {
      + arn                    = (known after apply)
      + data_encryption_key_id = (known after apply)
      + description            = "Xfusion Snapshot"
      + encrypted              = (known after apply)
      + id                     = (known after apply)
      + kms_key_id             = (known after apply)
      + owner_alias            = (known after apply)
      + owner_id               = (known after apply)
      + storage_tier           = (known after apply)
      + tags                   = {
          + "Name" = "xfusion-vol-ss"
        }
      + tags_all               = {
          + "Name" = "xfusion-vol-ss"
        }
      + volume_id              = "vol-27383341a9130f24d"
      + volume_size            = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform
can't guarantee to take exactly these actions if you run "terraform
apply" now.

bob@iac-server ~/terraform via 💠 default ➜  terraform apply
aws_ebs_volume.k8s_volume: Refreshing state... [id=vol-27383341a9130f24d]

Terraform used the selected providers to generate the following
execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_ebs_snapshot.xfusion-vol-ss will be created
  + resource "aws_ebs_snapshot" "xfusion-vol-ss" {
      + arn                    = (known after apply)
      + data_encryption_key_id = (known after apply)
      + description            = "Xfusion Snapshot"
      + encrypted              = (known after apply)
      + id                     = (known after apply)
      + kms_key_id             = (known after apply)
      + owner_alias            = (known after apply)
      + owner_id               = (known after apply)
      + storage_tier           = (known after apply)
      + tags                   = {
          + "Name" = "xfusion-vol-ss"
        }
      + tags_all               = {
          + "Name" = "xfusion-vol-ss"
        }
      + volume_id              = "vol-27383341a9130f24d"
      + volume_size            = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_ebs_snapshot.xfusion-vol-ss: Creating...
aws_ebs_snapshot.xfusion-vol-ss: Creation complete after 0s [id=snap-d540e4618e42f8964]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.