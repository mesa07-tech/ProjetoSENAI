variable "vpc_id" {
    type = string
}
variable "subnets" {
    type = list(string)
}
variable "alb_name" {
     default = "ecs-alb" 
}
variable "target_group_port" {
     default = 5000 
}
variable "target_group_protocol" {
     default = "HTTP" 
}
variable "security_group_ids" {
    type = list(string)  
}