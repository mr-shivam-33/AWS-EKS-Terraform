# AWS-EKS-Terraform


# DevOps Documentation
# Introduction
DevOps is the combination of cultural, engineering practices and patterns, and tools
that increase an organization's ability to deliver applications and services at high
velocity and better quality. Over time several essential practices have emerged when
adopting DevOps: Continuous Integration, Continuous Delivery, Infrastructure as Code,
and Monitoring and Logging.



## Installation
we will use Linux (Ubuntu) operating system.

Update your system

```bash
  sudo apt-get update
```
Insatll awscli version 1
```bash
sudo apt install awscli -y
```
OR

Insatll awscli version 2
```bash
sudo apt update
sudo apt search awscli
sudo apt install curl wget unzip -y
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
aws --version

output:
aws-cli/2.1.28 Python/3.8.8 Linux/4.19.121-linuxkit exe/x86_64.ubuntu.20 prompt/off
```
Install eksctl
```bash
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version

output:

```
Install kubectl
```bash
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.22.6/2022-03-09/bin/linux/amd64/kubectl
curl -o kubectl.sha256 https://s3.us-west-2.amazonaws.com/amazon-eks/1.22.6/2022-03-09/bin/linux/amd64/kubectl.sha256
openssl sha1 -sha256 kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
kubectl version --short --client 

output:

```
Install docker
```bash
sudo apt install docker.io -y	
```
We will use Terraform for automation.

Insatll Terraform 
```bash
sudo apt-get install wget curl unzip software-properties-common gnupg2 -y
sudo curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update -y
sudo apt-get install terraform -y
terraform -v

output:
Terraform v1.1.2
on linux_amd64
```






## Documentation

Step 1:- We need AWS plugins, use this link for script.

Click for terraform script of [AWS provider](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/AWS-provider/aws-provider.tf)

Step 2:- AWS connection with Terrafrom.

Click for terraform script of [AWS provider connection](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/AWS-provider/aws-provider-connection.tf)

Step 3:- Create VPC (Virtual private cloud) for EKS Cluster.

- VPC
    
    Click for terraform script of [VPC](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/vpc/vpc.tf)

- Internet Gateway

    Click for terraform script of [Internet Gateway](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/vpc/internet-gateway.tf)

- Subnets

    - Public Subnets
        
        Click for terraform script of [Public Subnet](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/vpc/Subnet/Public-subnet.tf)

    - Private Subnets

        Click for terraform script of [Private subnet](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/vpc/Subnet/Private-subnet.tf)

- Elastic IP

    Click for terraform script of [Elastic IP](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/vpc/elastic-ip.tf)

- NAT Gateway

    Click for terraform script of [NAT Gateway](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/vpc/NAT-gateway.tf)

- Route Table

    - Route Table

        Click for terraform script of [Route Table](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/vpc/Route-table/Route-table.tf)

    - Route table association

        Click for terraform script of [Route table association](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/vpc/Route-table/Route-table-association.tf)

Step 4:- Create AWS EKS Cluster

- EKS Cluster Role

    Click for terraform script of [EKS Cluster Role](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/EKS-Cluster/eks-cluster-role.tf)

- Create EKS Cluster

    Click for terraform script of [EKS Cluster](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/EKS-Cluster/eks-cluster.tf)

Step 5:- Create EC2 Worker node

- EKS node group role

    Click for terraform script of [Node group role](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/EKS-worker-node/EKS-node-group-role.tf)

- EC2 Worker node

    Click for terraform script of [Worker node](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/EKS-worker-node/worker-node.tf)

Step 6:- Create IAM OIDC Provider

- IAM OIDC Provider

    Click for terraform script of [OIDC Provider](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/IAM_OIDC_Provider/IAM-oidc-provider.tf)

- OIDC Test of S3 bucket as a Demo, If you want to test your OIDC Provider.

    Click for terraform script of [OIDC Test](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/IAM_OIDC_Provider/OIDC-test.tf)

Step 7:- Create Namespace in which you deploy your project containers.

Click for terraform script of [Namespace](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/kube-manifest/namespace.yml)

Step 8:- Create Cluster auto scaler for ec2 worker node.

Click for terraform script of [Cluster auto scaler](https://github.com/mr-shivam-33/AWS-EKS-Terraform/blob/main/AutoScale/Cluster-autoScaler.tf)






