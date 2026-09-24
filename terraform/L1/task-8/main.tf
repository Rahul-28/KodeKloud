# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-433526c4a65cb152a"
  ]

  tags = {
    Name = "nautilus-ec2"
  }
}

resource "aws_ami_from_instance" "nautilus-ec2-ami" {
  name = "nautilus-ec2-ami"
  source_instance_id = aws_instance.ec2.id
}

output "instance_id" {
  description = "Shows the ID of the EC2 instance used to create the AMI"
  value = aws_instance.ec2.id
}

bob@iac-server ~/terraform via 💠 default ➜  terraform plan
aws_instance.ec2: Refreshing state... [id=i-cb75f6792035c49af]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_ami_from_instance.nautilus-ec2-ami will be created
  + resource "aws_ami_from_instance" "nautilus-ec2-ami" {
      + architecture         = (known after apply)
      + arn                  = (known after apply)
      + boot_mode            = (known after apply)
      + ena_support          = (known after apply)
      + hypervisor           = (known after apply)
      + id                   = (known after apply)
      + image_location       = (known after apply)
      + image_owner_alias    = (known after apply)
      + image_type           = (known after apply)
      + imds_support         = (known after apply)
      + kernel_id            = (known after apply)
      + manage_ebs_snapshots = (known after apply)
      + name                 = "nautilus-ec2-ami"
      + owner_id             = (known after apply)
      + platform             = (known after apply)
      + platform_details     = (known after apply)
      + public               = (known after apply)
      + ramdisk_id           = (known after apply)
      + root_device_name     = (known after apply)
      + root_snapshot_id     = (known after apply)
      + source_instance_id   = "i-cb75f6792035c49af"
      + sriov_net_support    = (known after apply)
      + tags_all             = (known after apply)
      + tpm_support          = (known after apply)
      + uefi_data            = (known after apply)
      + usage_operation      = (known after apply)
      + virtualization_type  = (known after apply)

      + ebs_block_device (known after apply)

      + ephemeral_block_device (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + instance_id = "i-cb75f6792035c49af"

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.



bob@iac-server ~/terraform via 💠 default ➜  terraform apply
aws_instance.ec2: Refreshing state... [id=i-cb75f6792035c49af]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_ami_from_instance.nautilus-ec2-ami will be created
  + resource "aws_ami_from_instance" "nautilus-ec2-ami" {
      + architecture         = (known after apply)
      + arn                  = (known after apply)
      + boot_mode            = (known after apply)
      + ena_support          = (known after apply)
      + hypervisor           = (known after apply)
      + id                   = (known after apply)
      + image_location       = (known after apply)
      + image_owner_alias    = (known after apply)
      + image_type           = (known after apply)
      + imds_support         = (known after apply)
      + kernel_id            = (known after apply)
      + manage_ebs_snapshots = (known after apply)
      + name                 = "nautilus-ec2-ami"
      + owner_id             = (known after apply)
      + platform             = (known after apply)
      + platform_details     = (known after apply)
      + public               = (known after apply)
      + ramdisk_id           = (known after apply)
      + root_device_name     = (known after apply)
      + root_snapshot_id     = (known after apply)
      + source_instance_id   = "i-cb75f6792035c49af"
      + sriov_net_support    = (known after apply)
      + tags_all             = (known after apply)
      + tpm_support          = (known after apply)
      + uefi_data            = (known after apply)
      + usage_operation      = (known after apply)
      + virtualization_type  = (known after apply)

      + ebs_block_device (known after apply)

      + ephemeral_block_device (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + instance_id = "i-cb75f6792035c49af"

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_ami_from_instance.nautilus-ec2-ami: Creating...
aws_ami_from_instance.nautilus-ec2-ami: Creation complete after 5s [id=ami-d834e5225d9475acc]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

instance_id = "i-cb75f6792035c49af"
