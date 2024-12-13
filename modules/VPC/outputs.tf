output "vpc_id" { 
  value = aws_vpc.darede_vpc.id
}

output "public_subnets" {
  value       = aws_subnet.public_subnets[*].id
}

output "private_subnets" {
  value       = aws_subnet.private_subnets[*].id
}

output "vpc_cidr" {
  value       = aws_vpc.darede_vpc.cidr_block
}