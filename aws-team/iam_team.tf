variable "team_user_name" {
  description = "team iam user name"
}

variable "team_user_password" {
  description = "team iam user password"
}

resource "aws_iam_user" "team_user" {
  name = "${var.team_user_name}"
  path = "/team/"
}

resource "aws_iam_access_key" "team_user" {
  user = "${aws_iam_user.team_user.name}"
  provisioner "local-exec" {
    command = "AWS_DEFAULT_REGION=${var.region} AWS_ACCESS_KEY_ID=${var.access_key} AWS_SECRET_ACCESS_KEY=${var.secret_key} aws iam create-login-profile --user-name ${aws_iam_user.team_user.name} --password ${var.team_user_password} --password-reset-required || AWS_DEFAULT_REGION=${var.region} AWS_ACCESS_KEY_ID=${var.access_key} AWS_SECRET_ACCESS_KEY=${var.secret_key} aws iam update-login-profile --user-name ${aws_iam_user.team_user.name} --password ${var.team_user_password} --password-reset-required"
  }
}
