[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9b22fa10953040debe27c1861661e187)](https://www.codacy.com/manual/mudathirlawal/cicd-with-jenkins-docker-and-aws-eks?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=mudathirlawal/cicd-with-jenkins-docker-and-aws-eks&amp;utm_campaign=Badge_Grade)

# CI/CD with Jenkins, Docker, and AWS EKS

  In this project I applied the following skills and knowledge:

  Working in AWS
  Using Jenkins to implement Continuous Integration and Continuous Deployment
  Building pipelines
  Working with Ansible and CloudFormation to deploy clusters
  Building Kubernetes clusters
  Building Docker containers in pipelines

I developed a CI/CD pipeline for micro services applications with either rolling deployment. 
Set up Continuous Deployment, which includes:

Pushing the built Docker container to the Docker repository (using AWS ECR, create a custom Registry within the cluster, or another 3rd party Docker repository); and Deploying these Docker container(s) to a small Kubernetes cluster. For Kubernetes cluster I used use AWS Kubernetes as a Service,as uposed to buiding my own Kubernetes cluster. Then  deploying the Kubernetes cluster, I used either Ansible. I run these from within Jenkins as an independent pipeline.
