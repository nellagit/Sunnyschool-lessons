output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "cname" {
  value = aws_route53_record.cname_record.name
}