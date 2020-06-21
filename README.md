[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9b22fa10953040debe27c1861661e187)](https://www.codacy.com/manual/mudathirlawal/cicd-with-jenkins-docker-and-aws-eks?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=mudathirlawal/cicd-with-jenkins-docker-and-aws-eks&amp;utm_campaign=Badge_Grade)

# CI/CD with Jenkins, Docker, and AWS EKS
  DevOps Project: Udacity Cloud DevOps Engineer Nanodegree Capstone Project

# For Udacity Reviewers:
  Below is the external IP of the service I created:

  LOAD_BALANCER EXTERNAL_IP:                                                             
  abb33ae6a970c4529b28ddb178408210-462912395.us-west-2.elb.amazonaws.com

# Project Instructions:
    
  In this project you will apply the skills and knowledge which were developed throughout the Cloud DevOps Nanodegree program. These include:

  Working in AWS
  Using Jenkins to implement Continuous Integration and Continuous Deployment
  Building pipelines
  Working with Ansible and CloudFormation to deploy clusters
  Building Kubernetes clusters
  Building Docker containers in pipelines
  As a capstone project, the directions are rather more open-ended than they were in the previous projects in the program. You will also be able to make some of your own choices in this capstone, for the type of deployment you implement, which services you will use, and the nature of the application you develop.

  You will develop a CI/CD pipeline for micro services applications with either blue/green deployment or rolling deployment. You will also develop your Continuous Integration steps as you see fit, but must at least include typographical checking (aka “linting”). To make your project stand out, you may also choose to implement other checks such as security scanning, performance testing, integration testing, etc.!

  Once you have completed your Continuous Integration you will set up Continuous Deployment, which will include:

  Pushing the built Docker container(s) to the Docker repository (you can use AWS ECR, create your own custom Registry within your cluster, or another 3rd party Docker repository) ; and
  Deploying these Docker container(s) to a small Kubernetes cluster. For your Kubernetes cluster you can either use AWS Kubernetes as a Service, or build your own Kubernetes cluster. To deploy your Kubernetes cluster, use either Ansible or Cloudformation. Preferably, run these from within Jenkins as an independent pipeline.
