resource "aws_s3_bucket" "xfusion-s3-824428551" {
  bucket = var.bucket_name
  tags = {
      Name = var.bucket_name
  }
}

resource "aws_s3_bucket_ownership_controls" "s3_ownership_controls" {
  bucket = aws_s3_bucket.xfusion-s3-824428551.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_public_access" {
  bucket = aws_s3_bucket.xfusion-s3-824428551.id
  block_public_acls = var.block_public_acls
  block_public_policy = var.block_public_policy
  ignore_public_acls = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_acl" "s3_acl" {
  bucket = aws_s3_bucket.xfusion-s3-824428551.id
  acl = "public-read"
  depends_on = [
    aws_s3_bucket_ownership_controls.s3_ownership_controls,
    aws_s3_bucket_public_access_block.s3_public_access
  ]
}

bob@iac-server ~/terraform via 💠 default ➜  terraform init
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


bob@iac-server ~/terraform via 💠 default ➜  terraform plan

Terraform used the selected providers to generate the following
execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.datacenter-s3-813950388 will be created
  + resource "aws_s3_bucket" "datacenter-s3-813950388" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "datacenter-s3-813950388"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Name" = "datacenter-s3-813950388"
        }
      + tags_all                    = {
          + "Name" = "datacenter-s3-813950388"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule (known after apply)

      + grant (known after apply)

      + lifecycle_rule (known after apply)

      + logging (known after apply)

      + object_lock_configuration (known after apply)

      + replication_configuration (known after apply)

      + server_side_encryption_configuration (known after apply)

      + versioning (known after apply)

      + website (known after apply)
    }

  # aws_s3_bucket_acl.s3_acl will be created
  + resource "aws_s3_bucket_acl" "s3_acl" {
      + acl    = "public-read"
      + bucket = (known after apply)
      + id     = (known after apply)

      + access_control_policy (known after apply)
    }

  # aws_s3_bucket_ownership_controls.s3_ownership_controls will be created
  + resource "aws_s3_bucket_ownership_controls" "s3_ownership_controls" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + rule {
          + object_ownership = "BucketOwnerPreferred"
        }
    }

  # aws_s3_bucket_public_access_block.s3_public_access will be created
  + resource "aws_s3_bucket_public_access_block" "s3_public_access" {
      + block_public_acls       = false
      + block_public_policy     = false
      + bucket                  = (known after apply)
      + id                      = (known after apply)
      + ignore_public_acls      = false
      + restrict_public_buckets = false
    }

Plan: 4 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform
can't guarantee to take exactly these actions if you run "terraform
apply" now.


bob@iac-server ~/terraform via 💠 default ➜  terraform apply

Terraform used the selected providers to generate the following
execution plan. Resource actions are indicated with the following
symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.datacenter-s3-813950388 will be created
  + resource "aws_s3_bucket" "datacenter-s3-813950388" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "datacenter-s3-813950388"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Name" = "datacenter-s3-813950388"
        }
      + tags_all                    = {
          + "Name" = "datacenter-s3-813950388"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule (known after apply)

      + grant (known after apply)

      + lifecycle_rule (known after apply)

      + logging (known after apply)

      + object_lock_configuration (known after apply)

      + replication_configuration (known after apply)

      + server_side_encryption_configuration (known after apply)

      + versioning (known after apply)

      + website (known after apply)
    }

  # aws_s3_bucket_acl.s3_acl will be created
  + resource "aws_s3_bucket_acl" "s3_acl" {
      + acl    = "public-read"
      + bucket = (known after apply)
      + id     = (known after apply)

      + access_control_policy (known after apply)
    }

  # aws_s3_bucket_ownership_controls.s3_ownership_controls will be created
  + resource "aws_s3_bucket_ownership_controls" "s3_ownership_controls" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + rule {
          + object_ownership = "BucketOwnerPreferred"
        }
    }

  # aws_s3_bucket_public_access_block.s3_public_access will be created
  + resource "aws_s3_bucket_public_access_block" "s3_public_access" {
      + block_public_acls       = false
      + block_public_policy     = false
      + bucket                  = (known after apply)
      + id                      = (known after apply)
      + ignore_public_acls      = false
      + restrict_public_buckets = false
    }

Plan: 4 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_s3_bucket.datacenter-s3-813950388: Creating...
aws_s3_bucket.datacenter-s3-813950388: Creation complete after 0s [id=datacenter-s3-813950388]
aws_s3_bucket_public_access_block.s3_public_access: Creating...
aws_s3_bucket_ownership_controls.s3_ownership_controls: Creating...
aws_s3_bucket_public_access_block.s3_public_access: Creation complete after 0s [id=datacenter-s3-813950388]
aws_s3_bucket_ownership_controls.s3_ownership_controls: Creation complete after 0s [id=datacenter-s3-813950388]
aws_s3_bucket_acl.s3_acl: Creating...
aws_s3_bucket_acl.s3_acl: Creation complete after 0s [id=datacenter-s3-813950388,public-read]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
