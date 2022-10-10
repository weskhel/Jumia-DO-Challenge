resource "aws_security_group" "jumia-phone-ALB-sg" {
    name        = "jumia-phone-ALB-sg"
    description = "ALB security group"
   
    ingress {
      from_port   = 443
      to_port     = 8081
      protocol    = "tcp"
      cidr_blocks =  ["0.0.0.0/0"]
    }
  
    ingress {
      from_port   = 80
      to_port     = 8081
      protocol    = "tcp"
      cidr_blocks =  ["0.0.0.0/0"]
    }
  
    # Allow all outbound traffic.
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}

