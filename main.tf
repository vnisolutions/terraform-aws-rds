resource "aws_db_instance" "rds" {
  allocated_storage      = var.allocated_storage
  max_allocated_storage  = var.max_allocated_storage
  identifier             = "${var.env}-${var.project_name}-rds"
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.rds_instance_type
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.rds-subnets.name
  vpc_security_group_ids = aws_security_group.sg-rds[*].id
  publicly_accessible    = var.publicly_accessible
  multi_az               = var.multi_az
  # uncomment to set up backups  
  backup_window           = var.backup_window
  backup_retention_period = var.backup_retention_period
  maintenance_window      = var.maintenance_window
  skip_final_snapshot     = true
  tags = {
    Name        = "${var.env}-${var.project_name}-rds"
    Environment = "${var.env}"
    Management  = "terraform"
  }
}

resource "aws_db_subnet_group" "rds-subnets" {
  name       = "${var.env}-${var.project_name}-rds-subnets"
  subnet_ids = var.subnet_ids
}


resource "aws_security_group" "sg-rds" {
  name        = "${var.env}-${var.project_name}-rds-sg"
  description = "Allow Fargate to access rds"
  vpc_id      = var.vpc_id

  ingress = [
    {
      description      = "rds"
      from_port        = 0
      to_port          = 0
      protocol         = -1
      cidr_blocks      = var.cidr_ingress
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = var.sg_ingress
      self             = null
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      description      = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null

    }
  ]

  tags = {
    Name        = "${var.env}-${var.project_name}-rds-sg"
    Environment = "${var.env}"
    Management  = "terraform"
  }
}
