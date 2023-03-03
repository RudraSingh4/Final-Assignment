 resource "aws_security_group" "rudra-security-group" {
    name = "rudra-security-group"
    description = "Enable HTTP/HTTPS access on port 80/4443"
    vpc_id = aws_vpc.rudra_vpc.id

    ingress {
        description = "HTTP access"
        from_port = 80
        to_port =  80
        protocol = "tcp"
        cidr_blocks = [var.security-group_cidr]


    }

    ingress {
        description = "HTTP access"
        from_port = 443
        to_port =  443
        protocol = "tcp"
        cidr_blocks = [var.security-group_cidr]


    }

    egress {
        from_port = 0
        to_port =  0
        protocol = -1
        cidr_blocks = [var.security-group_cidr]


    }

    tags = {
      Name = "rudra-security-group"
      owner =  "rudra.sinhgh@cloudeq.com"
      purpose = "training"
    }
   
 }