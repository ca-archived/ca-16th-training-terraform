variable "admin_user_name" {
  description = "admin iam user name"
}

variable "admin_user_password" {
  description = "admin iam user password"
}

resource "aws_iam_user" "admin_user" {
    name = "${var.admin_user_name}"
    path = "/admin/"
}

resource "aws_iam_access_key" "admin_user" {
    user = "${aws_iam_user.admin_user.name}"
    //provisioner "local-exec" {
    //    command = "AWS_DEFAULT_REGION=${var.region} AWS_ACCESS_KEY=${var.access_key} AWS_SECRET_ACCESS_KEY_ID=${var.secret_key} aws iam create-login-profile --user-name ${aws_iam_user.admin_user.name} --password ${var.admin_user_password} || AWS_DEFAULT_REGION=${var.region} AWS_ACCESS_KEY=${var.access_key} AWS_SECRET_ACCESS_KEY_ID=${var.secret_key} aws iam update-login-profile --user-name ${aws_iam_user.admin_user.name} --password ${var.admin_user_password}"
    //}
}

resource "aws_iam_policy" "billing_full_access" {
    name = "BillingFullAccess"
    path = "/"
    description = "BillingFullAccess"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
       "Sid": "Stmt1455114959000",
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

resource "aws_iam_policy_attachment" "admin_user_admin" {
    name = "${aws_iam_user.admin_user.name}_attachment"
    users = ["${aws_iam_user.admin_user.name}"]
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_policy_attachment" "admin_user_billing" {
    name = "${aws_iam_user.admin_user.name}_attachment"
    users = ["${aws_iam_user.admin_user.name}"]
    policy_arn = "${aws_iam_policy.billing_full_access.arn}"
}
