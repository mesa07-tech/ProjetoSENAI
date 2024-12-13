variable "cluster_name" {
  type = string
}

variable "vpc_id" {
  type = string

}

variable "public_subnets" {
  type = list(string)
  
}

variable "image_uri" {
  type = string
}

variable "target_group_arn" {
 type = string 
}