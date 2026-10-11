resource "aws_cloudwatch_metric_alarm" "nautilus-alarm" {
  alarm_name =  var.alarm_name
  comparison_operator  = var.threshold_operator
  metric_name = var.metric
  evaluation_periods = var.evaluation_periods
  threshold = var.threshold
  period = var.period
  statistic = "Average"
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

  # aws_cloudwatch_metric_alarm.nautilus-alarm will be created
  + resource "aws_cloudwatch_metric_alarm" "nautilus-alarm" {
      + actions_enabled                       = true
      + alarm_name                            = "nautilus-alarm"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanThreshold"
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 1
      + id                                    = (known after apply)
      + metric_name                           = "CPUUtilization"
      + period                                = 120
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 80
      + treat_missing_data                    = "missing"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform
can't guarantee to take exactly these actions if you run "terraform
apply" now.

bob@iac-server ~/terraform via 💠 default ➜  terraform apply
aws_cloudwatch_metric_alarm.nautilus-alarm: Refreshing state... [id=nautilus-alarm]

Terraform used the selected providers to generate the following
execution plan. Resource actions are indicated with the following
symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_cloudwatch_metric_alarm.nautilus-alarm will be updated in-place
  ~ resource "aws_cloudwatch_metric_alarm" "nautilus-alarm" {
        id                                    = "nautilus-alarm"
      ~ period                                = 120 -> 300
        tags                                  = {}
        # (21 unchanged attributes hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_cloudwatch_metric_alarm.nautilus-alarm: Modifying... [id=nautilus-alarm]
aws_cloudwatch_metric_alarm.nautilus-alarm: Modifications complete after 0s [id=nautilus-alarm]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.