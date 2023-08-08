resource "aws_db_instance" "video_recommendations_db" {
  identifier = "video-recommendations-db"
  allocated_storage = 20
  db_name = "cyf_videos"
  engine = "postgres"
  engine_version = "15"
  instance_class = "db.t4g.micro"
  username = var.db_username
  password = var.db_password
  tags = {
    Name = "video-recommendations-db"
  }
}