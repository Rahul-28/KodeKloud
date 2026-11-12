resource "aws_iam_policy" "iampolicy_john" {
    name = "iampolicy_john"
    policy = jsonencode({
        "Version" : "2012-10-17",
        "Statement" : [
            {
              "Effect" : "Allow",
              "Action" : [
                  "ec2:Describe*",
                  "ec2:GetSecurityGroupsForVpc"
              ],
              "Resource" : "*"
            },
            {
              "Effect" : "Allow",
              "Action" : "elasticloadbalancing:Describe*",
              "Resource" : "*"
            },
            {
              "Effect" : "Allow",
              "Action" : [
                  "cloudwatch:ListMetrics",
                  "cloudwatch:GetMetricStatistics",
                  "cloudwatch:Describe*"
              ],
              "Resource" : "*"
            },
            {
              "Effect" : "Allow",
              "Action" : "autoscaling:Describe*",
              "Resource" : "*"
            }
        ]
    })
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

  # aws_iam_policy.iampolicy_john will be created
  + resource "aws_iam_policy" "iampolicy_john" {
      + arn              = (known after apply)
      + attachment_count = (known after apply)
      + id               = (known after apply)
      + name             = "iampolicy_john"
      + name_prefix      = (known after apply)
      + path             = "/"
      + policy           = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "ec2:Describe*",
                          + "ec2:GetSecurityGroupsForVpc",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                  + {
                      + Action   = "elasticloadbalancing:Describe*"
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                  + {
                      + Action   = [
                          + "cloudwatch:ListMetrics",
                          + "cloudwatch:GetMetricStatistics",
                          + "cloudwatch:Describe*",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                  + {
                      + Action   = "autoscaling:Describe*"
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + policy_id        = (known after apply)
      + tags_all         = (known after apply)
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

  # aws_iam_policy.iampolicy_john will be created
  + resource "aws_iam_policy" "iampolicy_john" {
      + arn              = (known after apply)
      + attachment_count = (known after apply)
      + id               = (known after apply)
      + name             = "iampolicy_john"
      + name_prefix      = (known after apply)
      + path             = "/"
      + policy           = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "ec2:Describe*",
                          + "ec2:GetSecurityGroupsForVpc",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                  + {
                      + Action   = "elasticloadbalancing:Describe*"
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                  + {
                      + Action   = [
                          + "cloudwatch:ListMetrics",
                          + "cloudwatch:GetMetricStatistics",
                          + "cloudwatch:Describe*",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                  + {
                      + Action   = "autoscaling:Describe*"
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + policy_id        = (known after apply)
      + tags_all         = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_policy.iampolicy_john: Creating...
aws_iam_policy.iampolicy_john: Creation complete after 1s [id=arn:aws:iam::000000000000:policy/iampolicy_john]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
