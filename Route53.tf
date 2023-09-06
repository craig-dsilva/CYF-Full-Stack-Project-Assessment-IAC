resource "aws_route53_zone" "video_recommendations_server_domain" {
  name = "videorecommendations.craigdsilva.com"
}

resource "aws_route53_record" "video_recommendations_server_domain" {
  zone_id = aws_route53_zone.video_recommendations_server_domain.id
  name = aws_route53_zone.video_recommendations_server_domain.name
  type = "A"
  ttl = 30
  records = [aws_eip.video_recommendations_ip.public_ip]
}