resource "aws_s3_bucket" "nautilus-s3-617877110" {
    bucket = nautilus-s3-617877110
    tags = {
        Name = nautilus-s3-617877110
    }
}

resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
    bucket = aws_s3_bucket.nautilus-s3-617877110.id
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}

resource "aws_s3_bucket_acl" "s3_acl" {
    depends_on = [aws_s3_bucket_ownership_controls.ownership_controls]
    acl = "private"
    bucket = aws_s3_bucket.nautilus-s3-617877110.id
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

  # aws_s3_bucket.nautilus-s3-617877110 will be created
  + resource "aws_s3_bucket" "nautilus-s3-617877110" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "nautilus-s3-617877110"
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
          + "Name" = "nautilus-s3-617877110"
        }
      + tags_all                    = {
          + "Name" = "nautilus-s3-617877110"
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
      + acl    = "private"
      + bucket = (known after apply)
      + id     = (known after apply)

      + access_control_policy (known after apply)
    }

  # aws_s3_bucket_ownership_controls.ownership_controls will be created
  + resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + rule {
          + object_ownership = "BucketOwnerPreferred"
        }
    }

Plan: 3 to add, 0 to change, 0 to destroy.

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

  # aws_s3_bucket.nautilus-s3-617877110 will be created
  + resource "aws_s3_bucket" "nautilus-s3-617877110" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "nautilus-s3-617877110"
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
          + "Name" = "nautilus-s3-617877110"
        }
      + tags_all                    = {
          + "Name" = "nautilus-s3-617877110"
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
      + acl    = "private"
      + bucket = (known after apply)
      + id     = (known after apply)

      + access_control_policy (known after apply)
    }

  # aws_s3_bucket_ownership_controls.ownership_controls will be created
  + resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + rule {
          + object_ownership = "BucketOwnerPreferred"
        }
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_s3_bucket.nautilus-s3-617877110: Creating...
aws_s3_bucket.nautilus-s3-617877110: Creation complete after 0s [id=nautilus-s3-617877110]
aws_s3_bucket_ownership_controls.ownership_controls: Creating...
aws_s3_bucket_ownership_controls.ownership_controls: Creation complete after 0s [id=nautilus-s3-617877110]
aws_s3_bucket_acl.s3_acl: Creating...
aws_s3_bucket_acl.s3_acl: Creation complete after 0s [id=nautilus-s3-617877110,private]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.