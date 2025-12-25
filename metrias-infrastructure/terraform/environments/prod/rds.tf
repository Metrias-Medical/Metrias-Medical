resource "random_password" "db_password" {
  length  = 32
  special = false  # RDS has issues with some special chars
}

resource "aws_db_subnet_group" "main" {
  name       = "metrias-prod-db-subnet"
  subnet_ids = [aws_subnet.private_data.id, aws_subnet.private_data_b.id]

  tags = {
    Name = "metrias-prod-db-subnet"
  }
}

resource "aws_db_instance" "main" {
  identifier     = "metrias-prod-postgres"
  engine         = "postgres"
  engine_version = "15"
  instance_class = "db.t3.micro"
  
  allocated_storage = 20
  storage_type      = "gp3"
  storage_encrypted = true
  
  db_name  = "dispoassist"
  username = "dispoassist_admin"
  password = random_password.db_password.result
  
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.database.id]
  
  multi_az               = false
  publicly_accessible    = false
  skip_final_snapshot    = true
  backup_retention_period = 7
  
  tags = {
    Name = "metrias-prod-postgres"
  }
}

output "db_endpoint" {
  value     = aws_db_instance.main.endpoint
  sensitive = false
}

output "db_password" {
  value     = random_password.db_password.result
  sensitive = true
}
