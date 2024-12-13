output "demo_app_repo_url" {
  value = aws_ecr_repository.app.repository_url
}

output "ecs_service_id" {
  value = aws_ecs_service.service.id
}

output "sg_id" {
  value = aws_security_group.ecs_node_sg.id
  
}