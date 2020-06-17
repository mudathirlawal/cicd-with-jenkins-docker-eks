pipeline {
    agent any

    stages {
        stage('Cloning git repo') {
            steps {
                sh 'echo "STAGE 0: Cloning app code from SCM ..."'
                git 'https://github.com/mudathirlawal/cicd-with-jenkins-docker-and-aws-eks.git'
            }    
        }        
        stage('Lint all app code') {
            steps {
                sh 'echo "STAGE 1: Checking app code for syntax error ..."'
                sh "tidy -q -e *.html"
            }
        }   
        stage( 'Build docker image for app' ) {
            steps {
                sh 'echo "STAGE 2: Building and tagging docker image ..."'
                sh "sudo docker build -t nigercode/web-app:v1.0 ."
                sh "sudo docker image ls"                    
            }
        } 
        stage( 'Push docker image to dockerhub repository' ) {
            steps {
                withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
                    sh 'echo "STAGE 3: Uploading docker image to dockerhub repository ..."'
                    sh "sudo docker login -u nigercode"
                    sh "sudo docker tag nigercode/web-app:v1.0 nigercode/web-app:v1.0"
                    sh "sudo docker push nigercode/web-app:v1.0"          
                }
            }
        }                                   
        stage( 'Deploy docker image to AWS Elastic Kubernetes Service cluster' ) {
            steps {
                withAWS( region:'us-west-2', credentials:'capstone' ) {
                    sh 'echo "STAGE 4: Deploying docker image to AWS EKS cluster ..."'                    
                    sh "aws eks --region us-west-2 update-kubeconfig --name capstone"
                    // sh "kubectl config use-context arn:/capstone"
                    sh "kubectl set image deployments/web-app web-app=nigercode/web-app:v1.0"
                    sh "kubectl apply -f deployment/deployment.yml"
                    sh "kubectl get nodes"
                    sh "kubectl get deployment"
                    sh "kubectl get pod -o wide"
                    sh "kubectl get services/web-app"
                    sh 'echo "Congratulations! Deployment successful."'
                    sh "kubectl decribe deployment/nigercode/web-app"
                }
            }
        }               
    }
}