# aws_ecr_repository.repository:
resource "aws_ecr_repository" "repository" {
    image_tag_mutability = "MUTABLE"
    name                 = "py-container"
    tags                 = {}

    image_scanning_configuration {
        scan_on_push = false
    }

    timeouts {}
}
