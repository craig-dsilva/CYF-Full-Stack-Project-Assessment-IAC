resource "aws_s3_bucket" "video_recommendations_client" {
  bucket = "video-recommendations-client"

}

resource "aws_s3_bucket_website_configuration" "video_recommendations_client" {
  bucket = aws_s3_bucket.video_recommendations_client.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "video_recommendations_client" {
  bucket = aws_s3_bucket.video_recommendations_client.id
}

resource "aws_s3_bucket_policy" "video_recommendations_client_policy" {
  bucket = aws_s3_bucket.video_recommendations_client.id
  policy = data.aws_iam_policy_document.video_recommendations_client_policy.json
}

data "aws_iam_policy_document" "video_recommendations_client_policy" {
  statement {
    principals {
      type = "AWS"
      identifiers = ["*"]
    }
    actions = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.video_recommendations_client.bucket}/*"]
  }
}