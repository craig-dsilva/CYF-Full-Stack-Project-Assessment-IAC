resource "aws_codedeploy_app" "video_recommendations_server" {
  name = "video-recommendations-server"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["codedeploy.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "CodeDeployRole" {
  name = "CodeDeployRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "CodeDeployRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role = aws_iam_role.CodeDeployRole.name
}

resource "aws_codedeploy_deployment_group" "video_recommendations_server" {
  app_name = aws_codedeploy_app.video_recommendations_server.name
  deployment_group_name = aws_codedeploy_app.video_recommendations_server.name
  service_role_arn = aws_iam_role.CodeDeployRole.arn

  ec2_tag_set {
    ec2_tag_filter {
      key = "Name"
      type = "KEY_AND_VALUE"
      value = "video-recommendations"
    }
  }
}