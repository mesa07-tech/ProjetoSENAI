variable "shared_config_files" {
  type = list(string)
}

variable "shared_credentials_files" {
  type = list(string)
}

variable "cluster_name" {
  type = string

}

variable "image_uri" {
  type = string
  
}

variable "rds_username" {
  type = string
}

variable "rds_password" {
  type = string 
}