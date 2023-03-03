# Crreate  a VPC
resource "aws_vpc" "rudra_vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Name = "rudra_vpc"
        owner = "rudra.singh@cloudeq.com"
        purpose = "training"
    }
  
}

# Create  Public subnet
resource "aws_subnet" "rudra_public_subnet_1" {
    vpc_id = aws_vpc.rudra_vpc.id
    cidr_block = var.subnet_cidr
    availability_zone = "ap-south-1"

    tags = {
      Name = "rudra_public_subnet_1"
      owner = "rudra.singh@cloudeq.com"
      purpose = "training"
    }
  
}


# Crreate a Internet gateway.
resource "aws_internet_gateway" "rudra_internet_gateway" {
    vpc_id = aws_vpc.rudra_vpc.id

    tags = {
      Name = "rudra_internet_gateway"
      owner = "rudra.singh@cloudeq.com"
      purpose= "training"
    }
  
}

# Crreate a Route table
resource "aws_route_table" "rudra_route" {
    vpc_id = aws_vpc.rudra_vpc.id

    route  {
        cidr_block = var.route_cidr
        gateway_id  = aws_internet_gateway.rudra_internet_gateway.id
    }
  
}

# Create Ec2 instance  Using For each
 
resource "aws_instance" "this"{
    # count = length(var.tag-name)   # Here we write any Integer also.
    #if we put 4 them we got error Invalid index bcz we define a variable 3. It is out of bound.
    ami                   = var.ami-id
    instance_type         ="t2.micro"
    tags={
        # Name=var.tag-name[count.index]
        Name = "Rudra1"
        Owner="rudra.singh@cloudeq.com"

    }
    tags_all={
        # Name=var.tag-name[count.index]
        Name = "Rudra1"
        Owner="rudra.singh@cloudeq.com"

    }
    volume_tags = {
        # Name=var.tag-name[count.index]
        Name = "Rudra1"
        Owner="rudra.singh@cloudeq.com"
    } 
}

