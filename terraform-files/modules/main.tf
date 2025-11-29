resource "aws_vpc" "vpc-main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.environment}-vpc"
  }
}

resource "aws_subnet" "public-subnet" {
    cidr_block = var.public_subnet_cidr
    vpc_id     = aws_vpc.vpc-main.id
    tags = {
        Name = "${var.environment}-public-subnet"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc-main.id
    tags = {
        Name = "${var.environment}-igw"
    }
}

resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.vpc-main.id
    route {
        gateway_id = aws_internet_gateway.igw.id
        cidr_block = "0.0.0.0/0"
    }
    tags = {
        Name = "${var.environment}-public-rt"
    }
}

resource "aws_route_table_association" "public-rt-assoc" {
    subnet_id      = aws_subnet.public-subnet.id
    route_table_id = aws_route_table.public-rt.id
}

resource "aws_security_group" "security-group" {
    name = "${var.environment}-sg"
    description = "Security group for ${var.environment} environment"
    vpc_id = aws_vpc.vpc-main.id
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 5173
        to_port     = 5173
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 9000
        to_port     = 9000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_key_pair" "mykey-pair" {
    key_name   = "${var.key_name}"
    public_key = file("../../../vm/${var.key_name}.pub")
  
}

resource "aws_instance" "jenkins-server" {
    ami           = var.ami # Example AMI ID, replace with a valid one for your region
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id     = aws_subnet.public-subnet.id
    security_groups = [aws_security_group.security-group.id]
    associate_public_ip_address = true
    tags = {
        Name = "${var.environment}-jenkins-server"
    }
    user_data = file("../../../scripts/jenkins_server_data.sh")
}

resource "aws_instance" "jenkins-agent" {
    ami           = var.ami # Example AMI ID, replace with a valid one for your region
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id     = aws_subnet.public-subnet.id
    security_groups = [aws_security_group.security-group.id]
    associate_public_ip_address = true
    tags = {
        Name = "${var.environment}-jenkins-agent"
    }
    user_data = file("../../../scripts/jenkins_server_data.sh")
}