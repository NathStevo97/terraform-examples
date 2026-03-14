#variable "user_number" {
#    type = number
#}
variable "elb_name" {
  type = string
}

variable "elb_region" {
  type = list(any)
}

variable "timeout" {
  type = number
}
