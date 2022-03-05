# GitHub Actions workflow to deploy to Amazon EKS on Fargate

[![Deploy to Amazon ECS](https://github.com/Muchezz/node-hello-app/actions/workflows/pipeline.yml/badge.svg?branch=main)](https://github.com/Muchezz/node-hello-app/actions/workflows/pipeline.yml)

## Creating and managing the lifecycle of an Amazon EKS cluster running on AWS Fargate.

A workflow that uses GitHub Actions to build a node js into a container image tagged with the git sha, push that image to Amazon Elastic Container Registry, and deploy to Amazon EKS on using AWS Fargate with the image tag injected by Kustomize. An Ingress will create the needed ALB.

## Secrets
The following secrets are required to be set on the repository:
- Go to settings 
- Click on `secrets` then `actions`
- Add new Repository Secret.

1. AWS_ACCESS_KEY_ID: An AWS access key ID for an account having the EKS IAM role
2. AWS_SECRET_ACCESS_KEY: An AWS secret sccess key for an account having the EKS IAM role

You can also add other variables. 
![variables](/images/secrets.png)