resource "aws_security_group" "rdssg" {
  name_prefix = "rds-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3306 
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.16.0.0/16"]  #caso de errado trocar por 0.0.0.0/0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "rds" {
    allocated_storage = var.rds_allocated_storage
    storage_type = var.rds_storage_type
    engine = "mysql"
    instance_class = var.rds_instance_class
    username = var.rds_username
    password = var.rds_password 
    vpc_security_group_ids = [aws_security_group.rdssg.id]
    db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
    publicly_accessible = var.publicly_accessible
    port = var.rds_port
    identifier = var.rds_identifier
    parameter_group_name = var.rds_parameter_group_name
    skip_final_snapshot = var.rds_skip_final_snapshot
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = var.subnet_ids 
}


