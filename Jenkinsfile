pipeline {
    agent any
    tools{
        terraform 'terraform-11'
    }
    environment{
        GITHUB_TOKEN=credentials('GitHub_token')
        AWS_ACCESS_KEY_ID=credentials('Accecs_key_ID')
        AWS_SECRET_ACCESS_KEY=credentials('Seceret_accsess_key')
        AWS_REGION="us-east-2"
        TF_VAR_availability_zone_a="$AWS_REGION"+"a"
        TF_VAR_availability_zone_b="$AWS_REGION"+"b"
        TF_VAR_project_name="testing"
        TF_VAR_image="https://hub.docker.com/repository/docker/norelfarjun/python80"
    }
    
    
    stages{
    
        stage('clean workspace') {
            steps {
                cleanWs()
            }
        }
    
        stage('git pull') {
            steps {
                sh '''
                    mkdir terraform_state
                    cd terraform_state
                    git init
                    git pull https://github.com/NorelFarjun/jenkins_server_tf_state.git main
                    cd ..
                    cp -r terraform_state/* ./
                    mkdir terraform
                    cd terraform
                    git init
                    git pull https://github.com/NorelFarjun/aws-terraform-ecs.git
                    cd ..
                    cp -r terraform_state/. ./
                '''
            }
        }
    
    
    
    
    
    
    
    
    
    
    }
    
    
    
    
    
    
    
    
    
    
}






/*    stages {
        
        stage('clean workspace') {
            steps {
                cleanWs()
            }
        }
        
        stage('git pull') {
            steps {
                sh '''
                    mkdir terraform_state
                    cd terraform_state
                    git init
                    git pull https://github.com/NorelFarjun/jenkins_server_tf_state.git
                    cd ..
                    cp -r terraform_state/. ./
                    mkdir terraform
                    cd terraform
                    git init
                    git pull https://github.com/NorelFarjun/aws-terraform-ecs.git
                    cd ..
                    cp -r terraform_state/. ./
                '''
            }
        }
        
        stage('terraform init and plan') {
            steps {
                sh '''
                    terraform init -no-color
                    terraform plan -no-color
                '''
            }
        }
        stage('test') {
            steps {
                sh "echo test scrips"
            }
        }
        
        stage('terraform apply') {
            steps {
                sh 'echo terraform apply'
            }
        }
        stage('push new terraform state to repo') {
            steps {
                sh '''
                    mkdir new_terraform_state
                    cd new_terraform_state
                    cp -r terraform/*.tfstate new_terraform_state
                    git init
                    git add *.tfstate
                    git commit -m "state: $(date +"%H:%M:%S---%m_%d_%Y")"
                    git push -f --set-upstream https://${GITHUB_TOKEN}@github.com/NorelFarjun/jenkins_server_tf_state.git master

                '''
            }
        }
            
        stage('clean workspace') {
            steps {
                cleanWs()
            }
        }
    }
}

*/
