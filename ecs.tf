# aws_ecs_service.ecs:
resource "aws_ecs_service" "ecs" {
    cluster                            = "arn:aws:ecs:us-east-1:541985950087:cluster/py-cluster"
    deployment_maximum_percent         = 200
    deployment_minimum_healthy_percent = 100
    desired_count                      = 1
    enable_ecs_managed_tags            = false
    health_check_grace_period_seconds  = 0
    iam_role                           = "aws-service-role"
    launch_type                        = "FARGATE"
    name                               = "py-service"
    platform_version                   = "LATEST"
    scheduling_strategy                = "REPLICA"
    tags                               = {}
    task_definition                    = "first-run-task-definition:11"

    deployment_controller {
        type = "ECS"
    }

    load_balancer {
        container_name   = "py-container"
        container_port   = 80
        target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:541985950087:targetgroup/ecs-py-clu-py-service/f2f906e0f208fc7a"
    }

    network_configuration {
        assign_public_ip = true
        security_groups  = [
            "sg-01f74bdbe3e7bc154",
        ]
        subnets          = [
            "subnet-049f2ba400b1c335a",
            "subnet-05747405d6c9b51c5",
        ]
    }

    timeouts {}
}
