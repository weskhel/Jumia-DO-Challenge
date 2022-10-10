resource "aws_security_group" "jumia-db-sg" {
  name        = "jumia-db-sg"
  description = "Allow access to PostgreSQL database from private network."

  tags = {
    Name = "jumia-db-sg"
  }
}
resource "aws_security_group_rule" "pgsql-default" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["172.31.0.0/16"]
  security_group_id = aws_security_group.jumia-db-sg.id
}

resource "aws_security_group_rule" "ssh_db" {
  type              = "ingress"
  from_port         = 1337
  to_port           = 1337
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jumia-db-sg.id
}