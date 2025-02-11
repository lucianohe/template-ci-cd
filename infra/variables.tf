# Crie um grupo de segurança
resource "aws_security_group" "allow_inbound" {
  name        = format("%s-sg", var.cluster_name)
  vpc_id      = var.vpc_id
  description = "Allow inbound traffic"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = format("%s-sg", var.cluster_name)
  }
}
-----

25. variables.tf dentro da diretório de infra
26. colar o conteúdo abaixo dentro do arquivo:
----
variable "cluster_name" {
  description = "Nome do cluster ECS"
  type        = string
}

variable "subnets_id" {
  description = "Subnets IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}