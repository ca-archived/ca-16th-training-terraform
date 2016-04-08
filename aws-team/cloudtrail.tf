variable "cloudtrail_bucket" {
  description = "cloudtrail log s3 bucket name"
}

resource "aws_cloudtrail" "logging" {
  name = "tf-trail"
  s3_bucket_name = "${aws_s3_bucket.tf_trail.id}"
  s3_key_prefix = "/"
  is_multi_region_trail = true
}

resource "aws_s3_bucket" "tf_trail" {
  bucket = "${var.cloudtrail_bucket}"
  force_destroy = true
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AWSCloudTrailAclCheck",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "s3:GetBucketAcl",
      "Resource": "arn:aws:s3:::${var.cloudtrail_bucket}"
    },
    {
      "Sid": "AWSCloudTrailWrite",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::${var.cloudtrail_bucket}/*",
      "Condition": {
          "StringEquals": {
            "s3:x-amz-acl": "bucket-owner-full-control"
          }
      }
    }
  ]
}
POLICY
}
