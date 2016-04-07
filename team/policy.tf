resource "aws_iam_policy" "billing_full_access" {
    name = "BillingFullAccess"
    path = "/"
    description = "BillingFullAccess"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
         "aws-portal:*"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_policy" "billing_read_access" {
    name = "BillingReadOnlyAccess"
    path = "/"
    description = "BillingReadOnlyAccess"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "aws-portal:ViewUsage",
        "aws-portal:ViewBilling"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "admin_user" {
    name = "${aws_iam_user.admin_user.name}_attachment"
    users = ["${aws_iam_user.admin_user.name}", "${aws_iam_user.team_user.name}"]
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_policy_attachment" "admin_user_billing" {
    name = "${aws_iam_user.admin_user.name}_attachment"
    users = ["${aws_iam_user.admin_user.name}"]
    policy_arn = "${aws_iam_policy.billing_full_access.arn}"
}

resource "aws_iam_policy_attachment" "team_user_billing" {
    name = "${aws_iam_user.team_user.name}_attachment"
    users = ["${aws_iam_user.team_user.name}"]
    policy_arn = "${aws_iam_policy.billing_read_access.arn}"
}
