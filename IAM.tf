resource "aws_iam_group" "video_recommendations" {
  name = "video_recommendations"
}

resource "aws_iam_user" "video_recommendation_pipeline" {
  name = "video-recommendations-pipeline"
}

resource "aws_iam_group_membership" "video_recommendations" {
  name = "video-recommendations"

  users = [aws_iam_user.video_recommendation_pipeline.name]

  group = aws_iam_group.video_recommendations.name
}

resource "aws_iam_group_policy" "video_s3" {
  name = "video-s3"
  group = aws_iam_group.video_recommendations.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
        Action = [
            "s3:GetObject",
            "s3:PutObject",
            "s3:ListBucket"
        ]
        Effect = "Allow"
        Resource = aws_s3_bucket.video_recommendations_client.arn
    }]
  })
}