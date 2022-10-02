pipeline {
    agent any
    tools{
        terraform 'terraform-11'
    }
    environment{
        AWS_ACCESS_KEY_ID=credentials('Accecs_key_ID')
        AWS_SECRET_ACCESS_KEY=credentials('Seceret_accsess_key')
        AWS_REGION="us-east-2"
        TF_VAR_availability_zone_a="$AWS_REGION"+"a"
        TF_VAR_availability_zone_b="$AWS_REGION"+"b"
        TF_VAR_project_name="testing"
        TF_VAR_image="https://hub.docker.com/repository/docker/norelfarjun/hello-world-python-5000"
    }

    stages {
        
        stage('clean workspace') {
            steps {
                cleanWs()
            }
        }
        
        stage('echo') {
            steps {
                dir("aws-terraform-ecs"){
                    sh 'pwd'
                }
            }
        }
        
        stage('terraform init and plan') {
            steps {         
                   //dir("aws-terraform-ecs"){sh "terraform init -no-color"}
                   //dir("aws-terraform-ecs"){ah "terraform plan -no-color"}
                sh 'echo sup'
            }
        }
        
        stage('terraform apply') {
            steps {
                sh 'echo terraform apply'
            }
        }
    }
}
