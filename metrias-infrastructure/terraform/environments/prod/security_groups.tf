resource "aws_security_group" "alb" {
  name        = "metrias-sg-alb"
  description = "Security group for Application Load Balancer"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "metrias-sg-alb"
  }
}

resource "aws_security_group_rule" "alb_ingress_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id
  description       = "Allow HTTPS from Internet"
}

resource "aws_security_group_rule" "alb_egress_vpc" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["10.0.0.0/16"]
  security_group_id = aws_security_group.alb.id
  description       = "Allow all traffic to VPC"
}

resource "aws_security_group" "compute" {
  name        = "metrias-sg-compute"
  description = "Security group for ECS Compute Tasks"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "metrias-sg-compute"
  }
}

resource "aws_security_group_rule" "compute_ingress_flask" {
  type                     = "ingress"
  from_port                = 5000
  to_port                  = 5000
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.alb.id
  security_group_id        = aws_security_group.compute.id
  description              = "Allow Flask port from ALB"
}

resource "aws_security_group_rule" "compute_ingress_streamlit" {
  type                     = "ingress"
  from_port                = 8501
  to_port                  = 8501
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.alb.id
  security_group_id        = aws_security_group.compute.id
  description              = "Allow Streamlit port from ALB"
}

resource "aws_security_group_rule" "compute_egress_https" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.compute.id
  description       = "Allow HTTPS outbound"
}

resource "aws_security_group_rule" "compute_egress_db" {
  type                     = "egress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.database.id
  security_group_id        = aws_security_group.compute.id
  description              = "Allow PostgreSQL to Database"
}

resource "aws_security_group" "database" {
  name        = "metrias-sg-database"
  description = "Security group for RDS Database"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "metrias-sg-database"
  }
}

resource "aws_security_group_rule" "database_ingress_compute" {
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.compute.id
  security_group_id        = aws_security_group.database.id
  description              = "Allow PostgreSQL from Compute"
}
