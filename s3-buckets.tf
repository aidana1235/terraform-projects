resource "aws_s3_bucket" "my_bucket" {
  for_each = toset(var.buckets)
  bucket = "${var.enviroment}-${var.region}-${each.value}"
  force_destroy = var.force_destroy
}
