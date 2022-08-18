resource "aws_ecr_repository" "q1-ecr" {
    name = "norel-ecr"
    image_tag_mutability = "MUTABLE"
    image_scanning_configuration {
        scan_on_push = true
    }
}


resource "aws_ecr_lifecycle_policy" "main" {
  repository = aws_ecr_repository.q1-ecr.name
 
  policy = jsonencode({
   rules = [{
     rulePriority = 1
     description  = "keep last 10 images"
     action       = {
       type = "expire"
     }
     selection     = {
       tagStatus   = "any"
       countType   = "imageCountMoreThan"
       countNumber = 10
     }
   }]
  })
}