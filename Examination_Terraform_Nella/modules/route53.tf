data "aws_route53_zone" "existing" {
  name         = "babkenasoyan.com"
  }

resource "aws_route53_record" "cname_record" {
  zone_id = data.aws_route53_zone.existing.zone_id
  name    = "nel.${data.aws_route53_zone.existing.name}"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.alb.dns_name]
}

