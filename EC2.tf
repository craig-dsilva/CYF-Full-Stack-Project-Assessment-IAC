resource "aws_instance" "video_recommendations-server" {
  ami = var.ec2_ami
  instance_type = "t2.micro"

  key_name = aws_key_pair.videos_key.key_name

  tags = {
    Name = "video-recommendations"
  }
}

resource "aws_key_pair" "videos_key" {
  key_name = "videos-key"
  public_key = file(var.videos_public_key)
}