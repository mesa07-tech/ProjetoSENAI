variable "waf_name" {
  type = string
}

variable "waf_scope" {
  type = string
  default = "REGIONAL"
}

variable "alb_arn" {
  type = string

}