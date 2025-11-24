# AWS-Architecting
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
  ```bash
  aws configure

%% Mermaid architecture diagram for AWS-Architecting repo
flowchart LR
  subgraph VPC [VPC (multi-az)]
    direction TB
    subgraph Public [Public Subnet]
      ALB[ALB (Ingress)]
      NAT[NAT Gateway]
      Bastion[Bastion / JumpBox]
    end
    subgraph Private [Private Subnet]
      EKS[EKS Cluster (workers)]
      EC2ASG[EC2 AutoScaling Group]
      RDS[RDS (Multi-AZ)]
      EFS[EFS]
    end
  end

  S3[S3 buckets]
  CloudTrail[CloudTrail / Audit]
  Monitoring[Prometheus + Grafana]
  IAM[IAM / KMS]
  Internet[Internet / Users]
  CICD[CI/CD (CodeBuild / GitHub Actions)]

  Internet --> ALB
  ALB --> EKS
  ALB --> EC2ASG
  NAT --> Private
  EKS --> Monitoring
  EC2ASG --> Monitoring
  RDS --> S3
  CloudTrail --> S3
  CICD --> ALB
  S3 --> EKS
