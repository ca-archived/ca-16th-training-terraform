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
  provisioner "local-exec" {
    command = "AWS_DEFAULT_REGION=${var.region} AWS_ACCESS_KEY_ID=${var.access_key} AWS_SECRET_ACCESS_KEY=${var.secret_key} aws iam create-login-profile --user-name ${aws_iam_user.admin_user.name} --password ${var.admin_user_password} || AWS_DEFAULT_REGION=${var.region} AWS_ACCESS_KEY_ID=${var.access_key} AWS_SECRET_ACCESS_KEY=${var.secret_key} aws iam update-login-profile --user-name ${aws_iam_user.admin_user.name} --password ${var.admin_user_password}"
  }
}
