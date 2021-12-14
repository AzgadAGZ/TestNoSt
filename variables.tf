variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = ""
}

variable "project" {
  type    = string
  default = "conekta"
}

variable "environment" {
  description = "The Environment (e.g. prod, dev, stg, qa, dce)."
  type        = string
}

variable "cost-center" {
  description = "Cost Center (e.g ENGINEERING, FINANCE)."
  type        = string
  default     = "ENGINEERING"
}

variable "team" {
  description = "Team Name."
  type        = string
}

variable "terraform" {
  description = "Deploy with terraform (e.g)"
  type        = bool
  default     = true
}

variable "pci-dss" {
  description = "Is PCI-DSS compliance"
  type        = bool
  default     = false
}

variable "enabled" {
  type        = bool
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources"
  default     = true
}

variable "resource" {
  type        = string
  description = "The AWS Resource Name (e.g eks, vpc, ALB, NLB, EIP, etc)"
}

# VPC Variables
variable "cidr_block" {
  description = "The CIDR Block to configure in the VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS Support on VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS Hostname on VPC"
  type        = bool
  default     = true
}

variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "vpc_tags" {
  type    = map(any)
  default = {}
}

# SUBNETS Variables
variable "newbits" {
  description = "Newbits to calculate subnets"
  type        = number
  default     = 8
}

variable "netnum" {
  type    = number
  default = 100
}

variable "map_public_ip_on_launch" {
  description = "Public IP"
  type        = bool
  default     = true
}

variable "public_subnets" {
  description = "Number of Public Subnets"
  type        = number
  default     = 1
}

variable "public_subnets_identifier" {
  type    = string
  default = "public"
}

variable "public_subnets_tags" {
  type    = map(any)
  default = {}
}

variable "custom_ingress_public_security_group" {
  type = map(object({
    from_port   = string
    to_port     = string
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = {}
}

variable "custom_ingress_private_security_group" {
  type = map(object({
    from_port   = string
    to_port     = string
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = {}
}

variable "private_subnets" {
  description = "Number of Private Subnets"
  type        = number
  default     = 0
}

variable "private_subnets_identifier" {
  type    = string
  default = "private"
}

variable "private_subnets_tags" {
  type    = map(any)
  default = {}
}
