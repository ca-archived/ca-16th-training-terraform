variable "access_key" {
  description = "AWS access key"
}

variable "secret_key" {
  description = "AWS secret access key"
}

variable "region" {
  description = "AWS region to host your network"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_iam_account_password_policy" "strict" {
    minimum_password_length = 8
    require_lowercase_characters = true
    require_numbers = true
    require_uppercase_characters = true
    allow_users_to_change_password = true
}
