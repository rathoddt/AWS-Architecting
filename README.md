# AWS-Architecting  
**Repository:** https://github.com/rathoddt/AWS-Architecting  

## Table of Contents  
- [Overview](#overview)  
- [Goals & Scope](#goals--scope)  
- [Repository Structure](#repository-structure)  
- [Getting Started](#getting-started)  
- [Usage](#usage)  
- [Contributing](#contributing)  
- [License](#license)  
- [Contact](#contact)  

## Overview  
This repository is a **hands-on AWS cloud architecture and DevOps playground**, showcasing reusable infrastructure patterns, Terraform templates, Kubernetes/EKS setups, logging/monitoring stacks, and other production-grade designs.

It is designed for:
- Cloud Architects  
- DevOps / SRE Engineers  
- Learners preparing for **AWS Solutions Architect / DevOps Engineer certifications**  
- Anyone experimenting with AWS infrastructure at scale  

## Goals & Scope  
- Provide **ready-to-deploy** Terraform modules and architecture patterns.  
- Demonstrate AWS best practices in **security**, **scalability**, **reliability**, and **operational excellence**.  
- Offer reference implementations for:
  - Networking (VPC, subnets, gateways)  
  - Compute (EC2, EKS, autoscaling)  
  - Storage (S3, EBS, EFS)  
  - Monitoring (Prometheus, Grafana)  
  - Observability (CloudTrail, Logging)  
- Enable rapid experimentation and learning.  

## Repository Structure  


### Folder Highlights
- **VPC/** – Core networking pattern with subnets, routing, NAT, IGW.  
- **EKS-with-terraform/** – Production-ready EKS setup using Terraform.  
- **Prometheus-and-Grafana/** – Monitoring stack with exporters.  
- **CloudTrail/** – Centralized audit logging setup.  
- **s3/** – Secure bucket configurations, lifecycle rules, encryption.  
- **EC2/** – Compute provisioning with user-data automation.  
- **GKE/** – Cross-cloud Kubernetes experiments (AWS vs GCP).  

## Getting Started  

### Prerequisites  
- AWS account with required IAM permissions  
- Terraform v1.x installed  
- AWS CLI configured:  
```
aws configure
```

Getting IP for ingress rule
```
curl https://checkip.amazonaws.com
```
