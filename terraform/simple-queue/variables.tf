variable "region" {
  description = "A região que será usada"
  type        = string
  default     = "us-east-1"
}

variable "aws_account_id" {
  description = "O id da conta na AWS"
  type        = string
}

variable "profile" {
  description = "O profile que será usado"
  type        = string
}

variable "billing" {
  description = "A área de cobrança do custo"
  type        = string
}

variable "environment" {
  description = "O ambiente que será usado"
  type        = string
}

variable "application" {
  description = "O nome da aplicação"
  type        = string
}

variable "provisioner" {
  description = "O nome do provisionador usado para construir a infraestrutura"
  type        = string
  default     = "Terraform"
}

