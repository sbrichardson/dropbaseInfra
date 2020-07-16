# aws_vpc.main:
resource "aws_vpc" "main" {
    assign_generated_ipv6_cidr_block = false
    cidr_block                       = "10.0.0.0/16"
    enable_classiclink               = false
    enable_classiclink_dns_support   = false
    enable_dns_hostnames             = true
    enable_dns_support               = true
    instance_tenancy                 = "default"
    tags                             = {
        "Description" = "Created for ECS cluster py-cluster"
        "Name"        = "ECS py-cluster - VPC"
    }
}

# aws_route_table.r:
resource "aws_route_table" "r" {
    propagating_vgws = []
    route            = []
    tags             = {}
    vpc_id           = "vpc-07e80ef7fae3e753f"
}

# aws_security_group.sg1:
resource "aws_security_group" "sg1" {
    description = "ELB Allowed Ports"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 3000
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 3000
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 80
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 80
        },
    ]
    name        = "EC2ContainerService-py-cluster-AlbSecurityGroup-1BERFKNMYTVY5"
    tags        = {
        "Description" = "Created for ECS cluster py-cluster"
        "Name"        = "ECS py-cluster - ALB SecurityGroup"
    }
    vpc_id      = "vpc-07e80ef7fae3e753f"

    timeouts {}
}

# aws_security_group.sg2:
resource "aws_security_group" "sg2" {
    description = "ECS Allowed Ports"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 3000
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 3000
        },
        {
            cidr_blocks      = []
            description      = ""
            from_port        = 1
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "sg-00e8642ff7c8dad60",
            ]
            self             = false
            to_port          = 65535
        },
    ]
    name        = "EC2ContainerService-py-cluster-EcsSecurityGroup-1JJ8BOA6AHUVM"
    tags        = {
        "Description" = "Created for ECS cluster py-cluster"
        "Name"        = "ECS py-cluster - ECS SecurityGroup"
    }
    vpc_id      = "vpc-07e80ef7fae3e753f"

    timeouts {}
}

# aws_security_group_rule.sg1:
resource "aws_security_group_rule" "sg1" {
    cidr_blocks       = [
        "0.0.0.0/0",
    ]
    from_port         = 0
    ipv6_cidr_blocks  = []
    prefix_list_ids   = []
    protocol          = "-1"
    security_group_id = "sg-00e8642ff7c8dad60"
    self              = false
    to_port           = 0
    type              = "egress"
}

# aws_security_group_rule.sg1-1:
resource "aws_security_group_rule" "sg1-1" {
    cidr_blocks       = [
        "0.0.0.0/0",
    ]
    from_port         = 80
    ipv6_cidr_blocks  = []
    prefix_list_ids   = []
    protocol          = "tcp"
    security_group_id = "sg-00e8642ff7c8dad60"
    self              = false
    to_port           = 80
    type              = "ingress"
}

# aws_security_group_rule.sg1-2:
resource "aws_security_group_rule" "sg1-2" {
    cidr_blocks       = [
        "0.0.0.0/0",
    ]
    from_port         = 3000
    ipv6_cidr_blocks  = []
    prefix_list_ids   = []
    protocol          = "tcp"
    security_group_id = "sg-00e8642ff7c8dad60"
    self              = false
    to_port           = 3000
    type              = "ingress"
}

# aws_security_group_rule.sg2:
resource "aws_security_group_rule" "sg2" {
    cidr_blocks              = []
    from_port                = 1
    ipv6_cidr_blocks         = []
    prefix_list_ids          = []
    protocol                 = "tcp"
    security_group_id        = "sg-079dc92b7ce7b7c9c"
    self                     = false
    to_port                  = 65535
    type                     = "ingress"
}

# aws_security_group_rule.sg2-1:
resource "aws_security_group_rule" "sg2-1" {
    cidr_blocks       = [
        "0.0.0.0/0",
    ]
    from_port         = 3000
    ipv6_cidr_blocks  = []
    prefix_list_ids   = []
    protocol          = "tcp"
    security_group_id = "sg-079dc92b7ce7b7c9c"
    self              = false
    to_port           = 3000
    type              = "ingress"
}

# aws_security_group_rule.sg2-2:
resource "aws_security_group_rule" "sg2-2" {
    cidr_blocks       = [
        "0.0.0.0/0",
    ]
    from_port         = 0
    ipv6_cidr_blocks  = []
    prefix_list_ids   = []
    protocol          = "-1"
    security_group_id = "sg-079dc92b7ce7b7c9c"
    self              = false
    to_port           = 0
    type              = "egress"
}
