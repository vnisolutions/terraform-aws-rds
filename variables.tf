variable "vpc_id" {
  description = "The ID of the VPC in which the endpoint will be used"
  type        = string
}

variable "subnet_ids" {
  description = "The ID of the VPC in which the endpoint will be used"
  type        = list(string)
}

variable "env" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "project_name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "db_name" {
  description = "Database administrator username"
  type        = string
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
}

variable "rds_instance_type" {
  description = "Database administrator password"
  type        = string
}

variable "sg_ingress" {
  description = "The ID of the VPC in which the endpoint will be used"
  type        = list(string)
  default     = null
}

variable "cidr_ingress" {
  description = "The ID of the VPC in which the endpoint will be used"
  type        = list(string)
  default     = null
}


variable "allocated_storage" {
  description = "Database administrator password"
  type        = number
  default     = 50
}

variable "max_allocated_storage" {
  description = "Database administrator password"
  type        = number
  default     = 200
}

variable "engine" {
  description = "Database administrator password"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Database administrator password"
  type        = string
  default     = "8.0"
}

variable "publicly_accessible" {
  description = "Database administrator password"
  type        = bool
  default     = false
}

variable "multi_az" {
  description = "Database administrator password"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Database administrator password"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "Database administrator password"
  type        = string
  default     = "17:00-17:30"
}

variable "maintenance_window" {
  description = "Database administrator password"
  type        = string
  default     = "Sun:18:00-Sun:18:30"
}

