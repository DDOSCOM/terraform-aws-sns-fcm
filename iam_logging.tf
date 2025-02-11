resource "aws_iam_role" "sns_logging" {
  count = var.enable_delivery_status_logging ? 1 : 0
  name  = "${var.platform_application_name}-sns-logging-role"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
        Service = "sns.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "sns_logging_attachment" {
  count      = var.enable_delivery_status_logging ? 1 : 0
  role       = aws_iam_role.sns_logging[0].name
  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/service-role/AmazonSNSRole"

}
