resource "aws_security_group" "jumia-sg" {
  name = "jumia-sg"
  description = "Allow access to phone validator from public network."

  tags = {
    Name = "jumia-sg"
  }
}
resource "aws_security_group_rule" "public_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jumia-sg.id
}
resource "aws_security_group_rule" "http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 8081
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jumia-sg.id
}
resource "aws_security_group_rule" "https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 8081
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jumia-sg.id
}
resource "aws_security_group_rule" "sshnew" {
  type              = "ingress"
  from_port         = 1337
  to_port           = 1337
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jumia-sg.id
}
resource "aws_security_group_rule" "sshdef" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jumia-sg.id
}