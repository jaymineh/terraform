output "alb_dns_name" {
  value       = aws_lb.ext-alb.dns_name
  description = "External load balance arn"
}

output "aws_lb_target_group_arn" {
  value = aws_lb_target_group.nginx-tgt.arn
}