resource "aws_instance" "video_recommendations-server" {
  ami = var.ec2_ami
  instance_type = "t2.nano"

  key_name = aws_key_pair.videos_key.key_name

  tags = {
    Name = "video-recommendations"
  }
}

resource "aws_key_pair" "videos_key" {
  key_name = "videos-key"
  public_key = file(var.videos_public_key)
}

resource "aws_eip" "video_recommendations_ip" {
  domain = "vpc"

  tags = {
    Name = "video_recommendations_ip"
  }
}

resource "aws_eip_association" "video_recommendations_ip" {
  instance_id = aws_instance.video_recommendations-server.id
  allocation_id = aws_eip.video_recommendations_ip.id
}