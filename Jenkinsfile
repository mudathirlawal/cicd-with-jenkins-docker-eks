pipeline {
    agent any

    stages {
        stage('Lint all app code') {
            steps {
                sh 'echo "STAGE 1: Checking app code for syntax error ..."'
                sh "tidy -q -e *.html"
            }
        }   
        stage( 'Build Docker image for app' ) {
            steps {
                sh 'echo "STAGE 2: Building and tagging Docker image ..."'
                sh "sudo docker build -t nigercode/web-app:v1.0 ."
                sh "sudo docker image ls"
            }
        } 
        stage( 'Push Docker image to dockerhub repository' ) {
            steps {
                withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
                    sh 'echo "STAGE 3: Uploading Docker image to dockerhub repository ..."'
                    sh "sudo docker login"
                    sh "sudo docker tag nigercode/web-app:v1.0 nigercode/web-app:v1.0"
                    sh "sudo docker push nigercode/web-app:v1.0"
                    }
                }
            }
        }                               
        stage( 'Create a Kubernetes cluster on AWS EKS' ) {
            steps {
                withAWS( region:'us-west-2', credentials:'capstone' ) {
                sh 'echo "STAGE 4: Creating a Kubernetes cluster on AWS EKS ..."'
                sh "eksctl create cluster \
                    --name capstone \
                    --version 1.16 \
                    --nodegroup-name standard-workers \
                    --node-type t2.medium \
                    --nodes 3 \
                    --nodes-min 1 \
                    --nodes-max 4 \
                    --node-ami auto \
                    --region us-west-2" 
                sh "aws eks list-clusters --region=us-west-2 --output=json"
                }
            }
        }    
        stage( 'Deploy Docker image to AWS Elastic Kubernetes Service cluster' ) {
            steps {
                withAWS( region:'us-west-2', credentials:'capstone' ) {
                sh "kubectl apply -f deployment.yml"
                sh "kubectl scale deployment/nigercode/web-app --replicas=4"
                sh "kubectl get deployments"
                sh "kubectl get services/nigercode/web-app"
                sh 'echo "Congratulations! Deployment successful."'
                sh "kubectl decribe deployment/nigercode/web-app"
                }
            }
        }               
    }
}
