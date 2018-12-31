variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "www_domain" {}
variable "root_domain" {}
variable "ssl_validation" {}
variable "ssh_pub_key" {}
variable "bucket_prefix" {}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "eu-central-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "us-east-1"
  alias = "us-east-1"
}

module "hugo-site" {
  source = "dannylinden/website-serverless/aws"

  // Project vars
  www_domain   = "${var.www_domain}" /* Your domain here */
  root_domain = "${var.root_domain}" /* Your root domain here */
  ssl-validation = "${var.ssl_validation}" /* How to validate SSL Cert */
  ssh_pub_key = "${var.ssh_pub_key}" /* Path to the SSH Pub key for CodeCommit authentification*/
  bucket_prefix = "${var.bucket_prefix}" /* Prefix for S3 Buckets*/
}