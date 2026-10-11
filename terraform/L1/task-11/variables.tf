variable "alarm_name" {
    default = "nautilus-alarm"
    description = "Name for Cloud watch alarm"
    type = string
}

variable "threshold_operator" {
    default = "GreaterThanThreshold"
    description = "Threshold operator to check for Cloud watch alarm"
    type = string
}

variable "metric" {
    default = "CPUUtilization"
    description = "Metric to check for Cloud watch alarm"
    type = string
}

variable "evaluation_periods" {
    default = 1
    description = "Number of times to check for Cloud watch alarm"
    type = number
}

variable "threshold" {
    default = 80
    description = "Actual Threshold to check for Cloud watch alarm"
    type = number
}

variable "period" {
    default = 300
    description = "Duration for Cloud watch alarm"
    type = number
}