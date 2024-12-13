output "target_group_arn" {
  value = aws_lb_target_group.ecs_tg.arn
}

output "alb_arn" {
  value = aws_lb.alb.arn
}