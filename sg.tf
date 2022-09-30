resource "aws_security_group" "q2-alb" {
    name   =  var.project_name
    vpc_id = aws_vpc.q2-vpc.id

  ingress {
   protocol         = "tcp"
   from_port        = 80
   to_port          = 80
   cidr_blocks      = ["0.0.0.0/0"]
  }
 
  egress {
   protocol         = "-1"
   from_port        = 0
   to_port          = 0
   cidr_blocks      = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "q2-ecs-tasks" {
  name   = var.project_name
  vpc_id = aws_vpc.q2-vpc.id
 
  ingress {
   protocol            = "tcp"
   from_port           = 80
   to_port             = 80
   security_groups     = [aws_security_group.q2-alb.id]   

  }
 
  egress {
   protocol         = "-1"
   from_port        = 0
   to_port          = 0
   cidr_blocks      = ["0.0.0.0/0"]
  }
}
