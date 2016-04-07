variable "datadog_user_name" {
  description = "datadog iam user name"
}

resource "aws_iam_user" "datadog_user" {
    name = "${var.datadog_user_name}"
    path = "/datadog/"
}

resource "aws_iam_access_key" "datadog_user" {
    user = "${aws_iam_user.datadog_user.name}"
}

resource "aws_iam_policy" "datadog_policy" {
    name = "DatadogAWSIntegrationPolicy"
    path = "/"
    description = "DatadogAWSIntegrationPolicy"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "autoscaling:Describe*",
        "cloudtrail:DescribeTrails",
        "cloudtrail:GetTrailStatus",
        "cloudwatch:Describe*",
        "cloudwatch:Get*",
        "cloudwatch:List*",
        "ec2:Describe*",
        "ec2:Get*",
        "ecs:Describe*",
        "ecs:List*",
        "elasticache:Describe*",
        "elasticache:List*",
        "elasticloadbalancing:Describe*",
        "iam:Get*",
        "iam:List*",
        "kinesis:Get*",
        "kinesis:List*",
        "kinesis:Describe*",
        "logs:Get*",
        "logs:Describe*",
        "logs:TestMetricFilter",
        "rds:Describe*",
        "rds:List*",
        "ses:Get*",
        "ses:List*",
        "sns:List*",
        "sns:Publish",
        "sqs:GetQueueAttributes",
        "sqs:ListQueues",
        "sqs:ReceiveMessage"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "datadog_policy" {
    name = "${aws_iam_user.datadog_user.name}_attachment"
    users = ["${aws_iam_user.datadog_user.name}"]
    policy_arn = "${aws_iam_policy.datadog_policy.arn}"
}
