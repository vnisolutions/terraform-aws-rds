output "rds_endpoint_info" {
  value = aws_db_instance.rds.endpoint
}

output "sg-rds" {
  value = [aws_security_group.sg-rds.id]
}