variable "rds_allocated_storage" {
    type = number
    default = 20
}

variable "rds_storage_type" {
    type = string
    default = "gp2"
}

variable "rds_instance_class" {
    type = string
    default = "db.t2.micro"
}
   
variable "rds_username" {
    type = string
}

variable "rds_password" {
    type = string
}

variable "rds_port" {
    type = number
    default = 3306
}

variable "rds_identifier" {
    type = string
}

variable "rds_parameter_group_name" {
    type = string
}

variable "rds_skip_final_snapshot" {
    type = bool
    default = true
}

variable "subnet_ids" {
    type = list(string)
}

variable "vpc_id" {
    type = string   
  
}

variable "publicly_accessible" {
    type = bool
    default = false
}