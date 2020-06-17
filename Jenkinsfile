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
                    sh 'echo "STAGE 3: Uploading docker image to dockerhub repository ..."'
                    sh "sudo docker login"
                    sh "sudo docker tag nigercode/web-app:v1.0 nigercode/web-app:v1.0"
                    sh "sudo docker push nigercode/web-app:v1.0"
                    }
                }
            }
        }                                   
        stage( 'Deploy Docker image to AWS Elastic Kubernetes Service cluster' ) {
            steps {
                withAWS( region:'us-west-2', credentials:'capstone' ) {
                sh 'echo "STAGE 4: Deploying docker image to AWS ..."'                    
                sh "aws eks --region us-west-2 update-kubeconfig --name capstone"
                sh "kubectl config use-context arn:/capstone"
                sh "kubectl set image deployments/web-app web-app=nigercode/web-app:v1.0"
                sh "kubectl apply -f deployment/deployment.yml"
                sh "kubectl scale deployment/nigercode/web-app --replicas=4"
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
