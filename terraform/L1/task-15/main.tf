resource "aws_iam_group" "iamgroup_kristy" {
    name = "iamgroup_kristy"
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

  # aws_iam_group.iamgroup_jim will be created
  + resource "aws_iam_group" "iamgroup_jim" {
      + arn       = (known after apply)
      + id        = (known after apply)
      + name      = "iamgroup_jim"
      + path      = "/"
      + unique_id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

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

  # aws_iam_group.iamgroup_jim will be created
  + resource "aws_iam_group" "iamgroup_jim" {
      + arn       = (known after apply)
      + id        = (known after apply)
      + name      = "iamgroup_jim"
      + path      = "/"
      + unique_id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_group.iamgroup_jim: Creating...
aws_iam_group.iamgroup_jim: Creation complete after 1s [id=iamgroup_jim]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.