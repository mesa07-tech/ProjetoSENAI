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

resource "aws_db_subnet_group" "database_subnet_group" {
  name         = "database-subnet-group"
  subnet_ids   = var.subnet_ids
}


resource "aws_db_instance" "rds" {
    allocated_storage = var.rds_allocated_storage
    storage_type = var.rds_storage_type
    engine = "mysql"
    engine_version = "8.0.39"
    instance_class = var.rds_instance_class
    username = var.rds_username
    password = var.rds_password 
    db_subnet_group_name = aws_db_subnet_group.database_subnet_group.name
    publicly_accessible = var.publicly_accessible
    port = var.rds_port
    identifier = var.rds_identifier
    skip_final_snapshot = var.rds_skip_final_snapshot
    vpc_security_group_ids = [aws_security_group.rdssg.id]
}


