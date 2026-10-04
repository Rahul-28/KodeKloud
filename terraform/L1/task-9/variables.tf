variable "az" {
    type = string
    description = "Variable for storing Availability Zone for the EBS."
    default = "us-east-1a"
}

variable "vol_type" {
    type = string
    description = "Variable for storing Volume Type for the EBS."
    default = "gp3"
}

variable "vol_size" {
    type = number
    description = "Variable for storing Volume Size for the EBS."
    default = 2
}

variable "nombre" {
    type = string
    description = "Variable for storing Name for the EBS."
    default = "xfusion-volume"
}
