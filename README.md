# =====================================================================================================================
# 🚀 DYNAMIC INFRASTRUCTURE RECOVERY PIPELINE
# =====================================================================================================================

# PROJECT TITLE
Dynamic Infrastructure Recovery Pipeline with Terraform, Docker, GitHub Actions, AWS EC2, Route53, and Automatic DNS Recovery

# AUTHOR
Anthony Uchenna Emeribe

# DOMAIN
auemeribetech.com.ng

# PROJECT CATEGORY
Enterprise DevOps | CI/CD Automation | Infrastructure as Code | Recovery Engineering

# ARCHITECTURE MODEL
Ephemeral Infrastructure + Dynamic DNS Recovery + Zero Idle Cost Architecture

# TECHNOLOGY STACK
✔ AWS EC2  
✔ AWS Route53  
✔ Terraform  
✔ Docker  
✔ GitHub Actions  
✔ Node.js  
✔ Express.js  
✔ Docker Hub  
✔ S3 Remote Backend  
✔ DynamoDB State Locking  

---

# =====================================================================================================================
# 📌 PROJECT OVERVIEW
# =====================================================================================================================

This project demonstrates:

✔ Dynamic EC2 infrastructure provisioning  
✔ Terraform Infrastructure as Code  
✔ GitHub Actions CI/CD automation  
✔ Docker container deployment  
✔ Automatic Route53 DNS recovery  
✔ Dynamic public IP recovery  
✔ Ephemeral infrastructure lifecycle  
✔ Enterprise recovery engineering  
✔ Zero idle AWS cost architecture  
✔ Remote Terraform state management  
✔ Automated infrastructure destruction and recreation  
✔ Automatic domain restoration after infrastructure recreation  

The infrastructure can be COMPLETELY destroyed using:

```bash
terraform destroy
```

Then automatically recreated using:

```bash
git push
```

OR

```bash
terraform apply
```

INCLUDING:

✔ EC2 recreation  
✔ Security group recreation  
✔ Dynamic public IP generation  
✔ Route53 DNS update  
✔ Docker redeployment  
✔ Domain restoration  
✔ Infrastructure recovery  

---

# =====================================================================================================================
# 🔥 COMPLETE ENTERPRISE EXECUTION FLOW
# =====================================================================================================================

```text
Developer Push
       ↓
GitHub Actions Trigger
       ↓
Terraform Apply
       ↓
Remote Terraform State Updated
       ↓
Dynamic EC2 Creation
       ↓
New Public IP Generated
       ↓
Route53 DNS Updated Automatically
       ↓
Docker Deployment via SSH
       ↓
Live Application
       ↓
terraform destroy
       ↓
Infrastructure Removed
       ↓
Zero Idle Cost
       ↓
Trigger Pipeline Again
       ↓
Infrastructure Recreated Automatically
       ↓
Domain Automatically Restored
```

---

# =====================================================================================================================
# 📌 PROJECT STRUCTURE
# =====================================================================================================================

```text
containerized-app-terraform-cicd/
│
├── app.js
├── package.json
├── package-lock.json
├── README.md
├── .gitignore
├── .dockerignore
├── Dockerfile
├── ecosystem.config.js
│
├── scripts/
│   └── wait-for-instance.sh
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars
│   └── versions.tf
│
├── docs/
│   ├── architecture.dot
│   └── architecture-diagram.png
│
└── .github/
    └── workflows/
        ├── deploy.yml
        └── destroy.yml
```

---

# =====================================================================================================================
# ⚙️ STEP 1 — INSTALL REQUIRED TOOLS
# =====================================================================================================================

# ---------------------------------------------------------
# INSTALL NODE.JS
# ---------------------------------------------------------

## MacOS

```bash
brew install node
```

## Verify

```bash
node -v
npm -v
```

Expected:

```text
v22.x.x
10.x.x
```

![Node.js Installation Verification](screenshots/node.js.png)

---

# ---------------------------------------------------------
# INSTALL DOCKER DESKTOP
# ---------------------------------------------------------

Download:

```text
https://www.docker.com/products/docker-desktop/
```

Verify:

```bash
docker --version
```

IMPORTANT:

Start Docker Desktop manually before continuing.

Expected:

```text
Docker version 27.x.x
```

![Docker Desktop Installation Verification](screenshots/docker-desktop-installation-verification.png)

---

# ---------------------------------------------------------
# INSTALL TERRAFORM
# ---------------------------------------------------------

1. Run to install:

```bash
brew tap hashicorp/tap

brew install hashicorp/tap/terraform
```

2. In instances where an upgrade is required, run:

```bash
brew upgrade hashicorp/tap/terraform
```
![Terraform Upgrade](screenshots/terraform-upgrade.png)

3. Verify:

```bash
terraform version
```

Expected:

```text
Terraform v1.5.x
```

![Terraform Version Verification](screenshots/terraform-version-verification.png)

---

# ---------------------------------------------------------
# INSTALL AWS CLI
# ---------------------------------------------------------

Install:

```bash
brew install awscli
```

Verify:

```bash
aws --version
```

![AWS CLI Installation Verification](screenshots/aws-cli-installation-verification.png)

---

# ---------------------------------------------------------
# INSTALL GITHUB CLI
# ---------------------------------------------------------

1. Install:

```bash
brew install gh
```

2. Verify:

```bash
gh --version
```

![GitHub CLI Installation Verification](screenshots/github-cli-installation-verification.png)

3. Upgrade:

```bash
brew upgrade gh
```
![GitHub CLI Upgrade](screenshots/gh-upgrade.png)
---

# ---------------------------------------------------------
# INSTALL GRAPHVIZ
# ---------------------------------------------------------

Install:

```bash
brew install graphviz
```

Verify:

```bash
dot -V
```
![GitHub CLI Installation Verification](screenshots/graphviz-installation-verification.png)
---

# =====================================================================================================================
# ⚙️ STEP 2 — CONFIGURE AWS
# =====================================================================================================================

Run:

```bash
aws configure
```

Enter:

```text
AWS Access Key ID
AWS Secret Access Key
AWS Region
Output Format
```

Example:

```text
us-east-1
json
```

![AWS Authentication](screenshots/aws-authentication.png)

Verify authentication:

```bash
aws sts get-caller-identity
```

![AWS Authentication Verification](screenshots/aws-authentication-verification.png)

---

# =====================================================================================================================
# ⚙️ STEP 3 — GENERATE SSH KEYS
# =====================================================================================================================

Generate keys:

```bash
ssh-keygen -t rsa -b 4096
```

Press ENTER through prompts.

Verify:

```bash
ls ~/.ssh
```

Expected:

```text
id_rsa
id_rsa.pub
```
![AWS Authentication Verification](screenshots/keys-generation-and-verification-status.png)
---

# =====================================================================================================================
# ⚙️ STEP 4 — CREATE PROJECT DIRECTORY
# =====================================================================================================================

```bash
mkdir containerized-app-terraform-cicd

cd containerized-app-terraform-cicd
```
![Project Directory Creation](screenshots/project-directory-creation.png)
---

# =====================================================================================================================
# ⚙️ STEP 5 — INITIALIZE NODE PROJECT
# =====================================================================================================================

```bash
npm init -y

npm install express
```
![Node Project Initialization](screenshots/node-project-initialization.png)
---

# =====================================================================================================================
# ⚙️ STEP 6 — CREATE PROJECT STRUCTURE
# =====================================================================================================================

1. Create directories:

```bash
mkdir -p terraform docs scripts .github/workflows screenshots
```

2. Create files:

```bash
touch app.js

touch README.md

touch .gitignore

touch .dockerignore

touch Dockerfile

touch ecosystem.config.js

touch package-lock.json

touch terraform/main.tf

touch terraform/versions.tf

touch terraform/variables.tf

touch terraform/outputs.tf

touch terraform/terraform.tfvars

touch docs/architecture.dot

touch docs/architecture-diagram.png

touch scripts/wait-for-instance.sh

touch .github/workflows/deploy.yml

touch .github/workflows/destroy.yml
```
![Created Subproject Directories](screenshots/created-sub-project-directories.png)

3. Verify structure:

```bash
tree -L 3 -I "node_modules|.git|.terraform"
```
![Project Structure Verification](screenshots/project-structure-verification.png)
---

# =====================================================================================================================
# ⚙️ STEP 7 — CREATE EXPRESS APPLICATION
# FILE: app.js
# =====================================================================================================================

1. Open:

```bash
nano app.js
```

2. Paste:

```javascript
// =========================================
// 🚀 Import Dependencies
// =========================================
const express = require('express');
const app = express();

// =========================================
// ⚙️ Application Configuration
// =========================================
const PORT = 3000;

// =========================================
// 🌐 Root Endpoint
// =========================================
app.get('/', (req, res) => {
  res.send('🚀 Dynamic Infrastructure Recovery Pipeline Active!');
});
// =========================================
// ❤️ Health Check Endpoint
// =========================================
app.get('/health', (req, res) => {
  res.json({
    status: "OK",
    recovery_mode: "ENABLED"
  });
});
// =========================================
// ▶️ Start Server
// =========================================
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
```

3. Save:

```text
CTRL + X
Y
ENTER
```
![Express Application Creation](screenshots/express-application-creation.png)
---

# =====================================================================================================================
# ⚙️ STEP 8 — UPDATE package.json
# FILE: package.json
# =====================================================================================================================

1. Open:

```bash
nano package.json
```

2. Replace with:

```json
{
  "name": "dynamic-recovery-app",
  "version": "1.0.0",
  "description": "Ephemeral Infrastructure Recovery Pipeline",
  "main": "app.js",
  "scripts": {
    "start": "node app.js",
    "test": "curl -f http://localhost:3000/health || exit 1"
  },
  "dependencies": {
    "express": "^4.18.2"
  }
}
```

3. Save:

```text
CTRL + X
Y
ENTER
```
![Updated Package.json File](screenshots/updated-package.json.png)
---

# =====================================================================================================================
# ⚙️ STEP 9 — CREATE ecosystem.config.js
# FILE: ecosystem.config.js
# =====================================================================================================================

1. Open:

```bash
nano ecosystem.config.js
```

2. Paste:

```javascript
module.exports = {
  apps: [
    {
      name: "cicd-app",
      script: "app.js",
      instances: 1,
      autorestart: true,
      watch: false,
      max_memory_restart: "200M",
      env: {
        NODE_ENV: "production",
        PORT: 3000
      }
    }
  ]
};
```
3. Save:

```text
CTRL + X
Y
ENTER
```
![Ecosystem.config.js Creation](screenshots/ecosystem.config.js-creation.png)
---

# =====================================================================================================================
# ⚙️ STEP 10 — TEST APPLICATION
# =====================================================================================================================

1. Start application:

```bash
npm start
```

2. Open browser:

```text
http://localhost:3000
```

3. Expected:

```text
🚀 Dynamic Infrastructure Recovery Pipeline Active!
```
![Browwser Verification for App.js Testing](screenshots/browser-verification-for-app.js-testing.png)

4. Test health endpoint:

```bash
curl http://localhost:3000/health
```

5. Expected:

```json
{
  "status": "OK",
  "recovery_mode": "ENABLED"
}
```
![Health Endpoint Testing](screenshots/health-endpoint-testing.png)
---

# =====================================================================================================================
# ⚙️ STEP 11 — CREATE Dockerfile
# FILE: Dockerfile
# =====================================================================================================================

1. Open:

```bash
nano Dockerfile
```

2. Paste:

```dockerfile
# ==========================================================
# DOCKERFILE
# ==========================================================
# =========================================
# 🐳 Base Image (Base environment)
# =========================================
FROM node:18-alpine

# =========================================
# 📁 Set Working Directory (Where app runs)
# =========================================
WORKDIR /app

# =========================================
# 📦 Copy Dependencies (Faster dependency caching)
# =========================================
COPY package*.json ./

# =========================================
# ⚙️ Install Production Dependencies (Install only the dependencies your app needs to run)
# =========================================
RUN npm install --production

# =========================================
# 📂 Copy Application Source Code
# =========================================
COPY . .

# =========================================
# 🌐 Expose Application Port
# =========================================
EXPOSE 3000

# =========================================
# ▶️ Start Application (Server)
# =========================================
CMD ["node", "app.js"]
```
![Dockerfile Creation](screenshots/dockerfile-creation.png)
---

# =====================================================================================================================
# ⚙️ STEP 12 — CREATE .dockerignore
# FILE: .dockerignore
# =====================================================================================================================

Open:

```bash
nano .dockerignore
```

Paste:

```text
node_modules
.git
.env
docs
terraform
.github
```
![Created .Dockerignore File](screenshots/created.dockerignore.png)
---

# =====================================================================================================================
# ⚙️ STEP 13 — CREATE .gitignore
# FILE: .gitignore
# =====================================================================================================================

Open:

```bash
nano .gitignore
```

Paste:

```text
# Node.js
node_modules/
npm-debug.log

# Environment variables
.env

# OS files
.DS_Store
Thumbs.db

# Logs
logs/
*.log

# Terraform
terraform/.terraform/
terraform/*.tfstate
terraform/*.tfstate.backup
terraform.tfstate
terraform.tfstate.backup
tfplan
*.tfplan
.terraform/
*.tfstate
*.tfstate.*
crash.log
override.tf
override.tf.json
*_override.tf
*_override.tf.json
.terraform.lock.hcl

# SSH Keys
*.pem
*.key

# Docker
docker-compose.override.yml

# IDE
.vscode/
.idea/
```
![Creation of .Gitignore File](screenshots/created.gitignore-file.png)
---

# =====================================================================================================================
# ⚙️ STEP 14 — BUILD DOCKER IMAGE
# =====================================================================================================================

1. Build image:

```bash
docker buildx build --platform linux/amd64 -t uchennaemeribe/dynamic-recovery-app:latest --push .
```
![Creation of Docker Image](screenshots/docker-build-image.png)

2. Run container:

```bash
docker run -d -p 3000:3000 dynamic-recovery-app
```
![Container Created Following Docker Run](screenshots/docker-run.png)

3. Verify:

```bash
curl http://localhost:3000/health
```
![Docker Container Created Image Verification](screenshots/docker-image-verification.png)
---

# =====================================================================================================================
# ⚙️ STEP 15 — LOGIN TO DOCKER HUB
# =====================================================================================================================

1. Login:

```bash
docker login
```
![Successful Docker Hub Login](screenshots/successful-dockerhub-login.png)

2. Create Docker Hub repository:
a. Go to:

Docker Hub Repository Creation Page￼(https://hub.docker.com/repositories?utm_source=chatgpt.com)

Then:

i. Click Create Repository
ii. Repository name:
```text
dynamic-recovery-app
```
iii. Choose:
    * Public OR Private
iv. Click Create

![Docker Hub Repository Creation](screenshots/docker-hub-repo-creation.png)

b. Tag image:

```bash
docker tag dynamic-recovery-app YOUR_DOCKER_USERNAME/dynamic-recovery-app:tagname
# By Substituting for the Docker Hub Username
docker tag dynamic-recovery-app uchennaemeribe/dynamic-recovery-app:latest
```
![Docker Hub Tagging](screenshots/docker-hub-tagging.png)

b. Push image:

```bash
docker push uchennaemeribe/dynamic-recovery-app:latest
```
![Docker Hub Image Push](screenshots/dockerhub-image-push.png)

d. Verify tag:
```bash
curl -s https://registry.hub.docker.com/v2/repositories/uchennaemeribe/dynamic-recovery-app/tags | jq -r '.results[].name'
```
![Docker Hub Image Tag Verification](screenshots/dockerhub-image-tag-verification.png)

e. The browser can be used to verify the existence of the pushed tagged dockerhub image:
![Docker Hub Image Push Verification using the DockerHub Account](screenshots/tag-verification-using-the-browser.png)
---

# =====================================================================================================================
# ⚙️ STEP 16 — CREATE REMOTE TERRAFORM STATE INFRASTRUCTURE
# =====================================================================================================================

# ---------------------------------------------------------
# CREATE S3 BUCKET
# ---------------------------------------------------------

```bash
aws s3api create-bucket --bucket dynamic-recovery-terraform-state --region us-east-1
```

IMPORTANT:

Bucket names MUST be globally unique.

![S3 Bucket Creation for Terraform State Command](screenshots/s3-bucket-creation.png)
---

# ---------------------------------------------------------
# ENABLE VERSIONING
# ---------------------------------------------------------

```bash
aws s3api put-bucket-versioning --bucket dynamic-recovery-terraform-state --versioning-configuration Status=Enabled
```

![Enabled Versioning](screenshots/version-enabled.png)
---

# ---------------------------------------------------------
# ENABLE ENCRYPTION
# ---------------------------------------------------------

```bash
aws s3api put-bucket-encryption --bucket dynamic-recovery-terraform-state --server-side-encryption-configuration '{
  "Rules": [
    {
      "ApplyServerSideEncryptionByDefault": {
        "SSEAlgorithm": "AES256"
      }
    }
  ]
}'
```
![Enabled Server Side Encryption](screenshots/server-side-encryption-enabled.png)
---

# ---------------------------------------------------------
# BLOCK PUBLIC ACCESS
# ---------------------------------------------------------

```bash
aws s3api put-public-access-block --bucket dynamic-recovery-terraform-state --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true
```
![Public Access Blockage](screenshots/public-access-blockage.png)
---
# ---------------------------------------------------------
# VERIFY BUCKET
# ---------------------------------------------------------
1. Run:
```bash
aws s3 ls
```
2. You should see:
```text
dynamic-recovery-terraform-state
```
![Bucket Verification](screenshots/bucket-verification.png)

# ---------------------------------------------------------
# CREATE DYNAMODB LOCK TABLE
# ---------------------------------------------------------

```bash
aws dynamodb create-table --table-name terraform-locks --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --billing-mode PAY_PER_REQUEST --region us-east-1
```
![Dynamodb Table Creation for State Locking](screenshots/dynamodb-table-creation-for-state-locking.png)
---
# ---------------------------------------------------------
# VERIFY TABLE
# ---------------------------------------------------------
1. Run:
```bash
aws dynamodb list-tables
```
2. You should see:
```text
terraform-locks
```
![Dynamodb Table Creation Verification](screenshots/table-verification.png)

3. With the backend component of the versions.tf file, the various components of the remote state infrastructure and their functions will involve:
![Functions of various components of the remote state infrastructure](screenshots/remote-state-infrastructure-roles.png)
---

# =====================================================================================================================
# ⚙️ STEP 17 — CREATE ROUTE53 HOSTED ZONE
# =====================================================================================================================

1. Create hosted zone:

```bash
aws route53 create-hosted-zone --name auemeribetech.com.ng --caller-reference "$(date +%s)"
```
![Hosted Zone Creation](screenshots/hosted-zone-creation.png)

2. Retrieve hosted zones properly:
i. Run:
```bash
aws route53 list-hosted-zones
```
![Hosted Zone Retrieval (Method 1)](screenshots/host-zone-retrieval(method-1).png)

ii. Alternatively, the host zones can be retrieved using:
```bash
aws route53 list-hosted-zones-by-name
```
![Hosted Zone Retrieval (Method 2)](screenshots/host-zone-retrieval(method-2).png)

3. Retrieve Route53 nameservers:
i. Run
```bash
aws route53 get-hosted-zone --id HOSTED_ZONE_ID

# Substituting for HOSTED_ZONE_ID
aws route53 get-hosted-zone --id Z04577001PKHX4712KXO
```
![Route 53 Nameservers Retrieval (Method 1)](screenshots/route-53-nameservers-retrieval(method-1).png)

ii. Alternatively, the host zones can be retrieved using:
```bash
aws route53 get-hosted-zone --id Z04577001PKHX4712KXO --query "DelegationSet.NameServers"
```
![Route 53 Nameservers Retrieval (Method 2)](screenshots/route-53-nameservers-retrieval(method-2).png)

4. Expected:

```text
ns-827.awsdns-39.net
ns-281.awsdns-35.com
ns-1979.awsdns-55.co.uk
ns-1424.awsdns-50.org
```

---

# =====================================================================================================================
# ⚙️ STEP 18 — UPDATE QSERVERS NAMESERVERS
# =====================================================================================================================

1. Login to:
- QServers
2. Proceed to:
- My Damin
2. Click on:
- My Domain

![Qservers Navigation to Nameservers' Configuration](screenshots/qservers-navigation-to-nameserver.png)

2. Replace existing nameservers with Azure nameservers.

![Domain Registrar Update Using Nameservers](screenshots/domain-registrar-update-with-nameservers.png)

3. Wait for propagation

4. After approximately 10–15 minutes, verify that the domain is now using Azure DNS nameservers.

Run:

```bash
dig auemeribetech.com.ng NS
```
![Domain Verification on Using Nameservers](screenshots/domain-nameserver-verification.png)

---

# =====================================================================================================================
# ⚙️ STEP 19 — CREATE TERRAFORM CONFIGURATION
# FILE: terraform/versions.tf
# =====================================================================================================================

1. Open:

```bash
nano terraform/versions.tf
```

2. Paste:

```hcl
# ============================================================
# FILE: terraform/versions.tf
# PURPOSE:
# Terraform Version + Provider Management
# ============================================================

terraform {

  required_version = ">= 1.5.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
# ==========================================================
# REMOTE TERRAFORM STATE
# ==========================================================

  backend "s3" {

    bucket         = "dynamic-recovery-terraform-state"

    key            = "global/terraform.tfstate"

    region         = "us-east-1"

    dynamodb_table = "terraform-locks"

    encrypt        = true
  }
}
```
![Versions.tf Creation](screenshots/versions.tf-creation.png)
---

# =====================================================================================================================
# ⚙️ STEP 20 — CREATE VARIABLES
# FILE: terraform/variables.tf
# =====================================================================================================================

1. Open:

```bash
nano terraform/variables.tf
```

2. Paste:

```hcl
# ============================================================
# FILE: terraform/variables.tf
# PURPOSE:
# Terraform Variable Definitions
# ============================================================

# ============================================================
# AWS REGION
# ============================================================

variable "aws_region" {

  description = "AWS deployment region"

  type = string

  default = "us-east-1"
}
# ============================================================
# EC2 INSTANCE TYPE
# ============================================================
variable "instance_type" {

  description = "EC2 instance type"

  type = string

  default = "t3.micro"
}
# ============================================================
# SSH PUBLIC KEY
# ============================================================
variable "public_key" {

  description = "SSH public key"

  type = string
}
```
![Variables.tf Creation](screenshots/variables.tf-creation.png)
---

# =====================================================================================================================
# ⚙️ STEP 21 — CREATE OUTPUTS
# FILE: terraform/outputs.tf
# =====================================================================================================================

1. Open:

```bash
nano terraform/outputs.tf
```

2. Paste:

```hcl
# ==========================================================
# FILE: terraform/outputs.tf
# PURPOSE: Outputs ONLY
# ==========================================================
output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "instance_public_dns" {
  value = aws_instance.app_server.public_dns
}
```
![Outputs.tf Creation](screenshots/outputs-creation.png)
---

# =====================================================================================================================
# ⚙️ STEP 22 — CREATE TERRAFORM VARIABLES
# FILE: terraform/terraform.tfvars
# =====================================================================================================================

1. Open:

```bash
nano terraform/terraform.tfvars
```

2. Paste:

```hcl
# ==========================================================
# FILE: terraform/terraform.tfvars
# PURPOSE:
# Terraform Environment Configuration
# ==========================================================
aws_region = "us-east-1"

instance_type = "t3.micro"
```
[Terraform.tfvars Creation](screenshots/terraform.tfvars-creation.png)
---

# =====================================================================================================================
# ⚙️ STEP 23 — CREATE MAIN TERRAFORM CONFIGURATION
# FILE: terraform/main.tf
# =====================================================================================================================

Open:

```bash
nano terraform/main.tf
```

Paste:

```hcl
# ============================================================
# FILE: terraform/main.tf
# PURPOSE:
# Dynamic EC2 Infrastructure Provisioning
#
# FEATURES:
# - Dynamic public IP allocation
# - Docker auto-installation
# - Ephemeral infrastructure
# - Zero persistent AWS resource strategy
# ============================================================

# ============================================================
# AWS PROVIDER CONFIGURATION
# ============================================================

provider "aws" {
  region = var.aws_region
}
# ============================================================
# RANDOM RESOURCE SUFFIX
# ============================================================

resource "random_id" "suffix" {
  byte_length = 2
}
# ============================================================
# UBUNTU AMI LOOKUP
# ============================================================

data "aws_ami" "ubuntu" {

  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
# ============================================================
# EC2 SSH KEY PAIR
# ============================================================

resource "aws_key_pair" "deployer" {

  key_name = "enterprise-deployer-key-${random_id.suffix.hex}"

  public_key = var.public_key
}
# ============================================================
# APPLICATION SECURITY GROUP
# ============================================================

resource "aws_security_group" "app_sg" {

  name = "containerized-app-sg-${random_id.suffix.hex}"

  description = "Security group for dynamic recovery application"

  ingress {

    description = "SSH Access"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    description = "Application Access"

    from_port = 3000
    to_port   = 3000
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}
# ============================================================
# EC2 APPLICATION SERVER
# ============================================================

resource "aws_instance" "app_server" {

  ami = data.aws_ami.ubuntu.id

  instance_type = var.instance_type

  key_name = aws_key_pair.deployer.key_name

  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash

              apt-get update -y

              apt-get install -y \
                docker.io \
                docker-compose \
                git \
                curl

              systemctl enable docker
              systemctl start docker

              usermod -aG docker ubuntu
              EOF

  tags = {
    Name        = "containerized-app-server"
    Environment = "production"
    ManagedBy   = "terraform"
    Project     = "dynamic-recovery-app"
  }
}
# ============================================================
# ROUTE53 HOSTED ZONE LOOKUP
# ============================================================
data "aws_route53_zone" "main" {

  name = "auemeribetech.com.ng"

  private_zone = false
}
# ============================================================
# AUTOMATIC DNS RECOVERY RECORD
# ============================================================
resource "aws_route53_record" "app_dns" {

  zone_id = data.aws_route53_zone.main.zone_id

  name = "auemeribetech.com.ng"

  type = "A"

  ttl = 60

  records = [
    aws_instance.app_server.public_ip
  ]
}
```
![Main.tf Creation](screenshots/main.tf-creation.png)
---

# =====================================================================================================================
# ⚙️ STEP 24 — CREATE WAIT SCRIPT
# FILE: scripts/wait-for-instance.sh
# =====================================================================================================================

1. Open:

```bash
nano scripts/wait-for-instance.sh
```

2. Paste:

```bash
#!/bin/bash

INSTANCE_IP=$1

echo "======================================="
echo "WAITING FOR EC2 INSTANCE INITIALIZATION"
echo "======================================="

SUCCESS=false

for i in {1..30}
do

  echo "Attempt $i of 30"

  ssh -i ~/.ssh/aws_key_pair \
    -o StrictHostKeyChecking=no \
    -o ConnectTimeout=10 \
    ubuntu@$INSTANCE_IP \
    "docker --version" && SUCCESS=true && break

  echo "Docker not ready yet..."

  sleep 10
done

if [ "$SUCCESS" != "true" ]; then

  echo "======================================="
  echo "INSTANCE INITIALIZATION FAILED"
  echo "======================================="

  exit 1
fi

echo "======================================="
echo "INSTANCE IS READY"
echo "======================================="
```

3. Make executable:

```bash
chmod +x scripts/wait-for-instance.sh
```
![Wait-For-Instance.sh Creation](screenshots/wait-for-instance.sh-creation.png)
---

# =====================================================================================================================
# ⚙️ STEP 25 — CREATE DEPLOY PIPELINE
# FILE: .github/workflows/deploy.yml
# =====================================================================================================================

Open:

```bash
nano .github/workflows/deploy.yml
```

Paste:

```yaml
# ==========================================================
# FILE: .github/workflows/deploy.yml
# PURPOSE:
# Enterprise CI/CD Pipeline
# Terraform Infrastructure Provisioning + Docker Deployment
#
# FEATURES:
# - Dynamic EC2 provisioning
# - Terraform automation
# - Secure SSH configuration
# - Dockerized application deployment
# - Apple Silicon → AMD64 compatibility
# - Dynamic infrastructure recovery
# - Automatic deployment pipeline
# ==========================================================

name: Build Provision Deploy

on:
  push:
    branches:
      - main

# ==========================================================
# GLOBAL ENVIRONMENT VARIABLES
# ==========================================================

env:
  AWS_REGION: us-east-1
  TF_WORKING_DIR: terraform

jobs:

# ==========================================================
# MAIN DEPLOYMENT JOB
# ==========================================================

  deploy:

    name: Provision Infrastructure and Deploy Container

    runs-on: ubuntu-latest

    steps:

# ==========================================================
# CHECKOUT REPOSITORY
# ==========================================================

      - name: Checkout Repository
        uses: actions/checkout@v4

# ==========================================================
# CONFIGURE AWS CREDENTIALS
# ==========================================================

      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ env.AWS_REGION }}

# ==========================================================
# LOGIN TO DOCKER HUB
# ==========================================================

      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

# ==========================================================
# SETUP DOCKER BUILDX
# REQUIRED FOR MULTI-ARCHITECTURE BUILDS
# ==========================================================

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

# ==========================================================
# BUILD AND PUSH DOCKER IMAGE
# APPLE SILICON → AMD64 COMPATIBILITY
# ==========================================================

      - name: Build and Push Docker Image
        run: |
          docker buildx build \
            --platform linux/amd64 \
            -t ${{ secrets.DOCKER_USERNAME }}/dynamic-recovery-app:latest \
            --push .

# ==========================================================
# SETUP TERRAFORM
# ==========================================================

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v3

# ==========================================================
# TERRAFORM INITIALIZATION
# ==========================================================

      - name: Terraform Init
        working-directory: terraform
        run: terraform init -reconfigure

# ==========================================================
# TERRAFORM VALIDATION
# ==========================================================

      - name: Terraform Validate
        working-directory: terraform
        run: terraform validate

# ==========================================================
# TERRAFORM PLAN
# ==========================================================

      - name: Terraform Plan
        working-directory: terraform
        env:
          TF_VAR_public_key: ${{ secrets.VM_PUBLIC_KEY }}
        run: |
          terraform plan \
            -var="public_key=${TF_VAR_public_key}" \
            -out=tfplan

# ==========================================================
# TERRAFORM APPLY
# ==========================================================

      - name: Terraform Apply
        working-directory: terraform
        run: |
          terraform apply \
            -auto-approve \
            tfplan

# ==========================================================
# CAPTURE EC2 INSTANCE INFORMATION
# ==========================================================

      - name: Capture EC2 Information
        working-directory: terraform
        run: |
          echo "INSTANCE_IP=$(terraform output -raw instance_public_ip)" >> $GITHUB_ENV
          echo "INSTANCE_DNS=$(terraform output -raw instance_public_dns)" >> $GITHUB_ENV

# ==========================================================
# CONFIGURE SSH PRIVATE KEY
# ==========================================================

      - name: Configure SSH Key
        run: |
          mkdir -p ~/.ssh

          echo "${{ secrets.VM_SSH_KEY }}" > ~/.ssh/aws_key_pair

          chmod 600 ~/.ssh/aws_key_pair

# ==========================================================
# WAIT FOR EC2 INSTANCE INITIALIZATION
# ==========================================================

      - name: Wait for EC2 Readiness
        run: |
          chmod +x scripts/wait-for-instance.sh
          ./scripts/wait-for-instance.sh "$INSTANCE_IP"

# ==========================================================
# DEPLOY DOCKER CONTAINER
# ==========================================================

      - name: Deploy Docker Container
        run: |
          ssh -i ~/.ssh/aws_key_pair \
            -o StrictHostKeyChecking=no \
            ubuntu@$INSTANCE_IP << EOF

            sudo docker rm -f dynamic-recovery-app || true

            sudo docker pull ${{ secrets.DOCKER_USERNAME }}/dynamic-recovery-app:latest

            sudo docker run -d \
              --name dynamic-recovery-app \
              -p 3000:3000 \
              --restart unless-stopped \
              ${{ secrets.DOCKER_USERNAME }}/dynamic-recovery-app:latest

          EOF

# ==========================================================
# DEPLOYMENT SUCCESS OUTPUT
# ==========================================================

      - name: Deployment Complete
        run: |
          echo "======================================="
          echo "DEPLOYMENT SUCCESSFUL"
          echo "======================================="
          echo "Application URL:"
          echo "http://$INSTANCE_IP:3000"
          echo ""
          echo "Live Domain:"
          echo "http://auemeribetech.com.ng:3000"
          echo "======================================="
```
![Deploy.yml File Creation](screenshots/deploy.yml-creation.png)
---

# =====================================================================================================================
# ⚙️ STEP 26 — CREATE DESTROY PIPELINE
# FILE: .github/workflows/destroy.yml
# =====================================================================================================================

Open:

```bash
nano .github/workflows/destroy.yml
```

Paste:

```yaml
# ==========================================================
# FILE: .github/workflows/destroy.yml
# ==========================================================

name: Destroy Infrastructure

on:
  workflow_dispatch:

jobs:

  destroy:

    runs-on: ubuntu-latest

    defaults:
      run:
        working-directory: terraform

    steps:
# =====================================================
# CHECKOUT
# =====================================================
      - name: Checkout Repository
        uses: actions/checkout@v4
# =====================================================
# AWS AUTHENTICATION
# =====================================================
      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1
# =====================================================
# TERRAFORM SETUP
# =====================================================
      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v3

      - name: Terraform Init
        run: terraform init

      - name: Terraform Validate
        run: terraform validate
# =====================================================
# TERRAFORM DESTROY
# =====================================================
      - name: Terraform Destroy
        run: |
          terraform destroy \
          -auto-approve \
          -var="public_key=${{ secrets.VM_PUBLIC_KEY }}"
```
![Destroy.yml File Creation](screenshots/destroy.yml-creation.png)
---

# =====================================================================================================================
# ⚙️ STEP 27 — CREATE ARCHITECTURE DIAGRAM
# =====================================================================================================================

Open:

```bash
nano docs/architecture.dot
```

Paste:

```dot
digraph G {

  rankdir=TB;

  bgcolor="white";

  node [
    shape=box,
    style="rounded,filled",
    fillcolor=lightblue,
    color=black,
    fontname="Helvetica"
  ];

  edge [
    color=gray40,
    penwidth=1.5
  ];

  Developer [shape=oval, fillcolor=lightgreen];

  GitHub [label="GitHub Repository"];

  GitHubActions [label="GitHub Actions CI/CD"];

  Terraform [label="Terraform Apply"];

  RemoteState [label="Remote Terraform State\n(S3 + DynamoDB)"];

  EC2 [label="Dynamic AWS EC2"];

  Route53 [label="Route53 Automatic DNS"];

  DockerHub [label="Docker Hub"];

  DockerDeploy [label="Docker Deployment via SSH"];

  Container [label="Docker Container"];

  Domain [label="auemeribetech.com.ng"];

  Browser [label="User Browser", shape=oval, fillcolor=lightyellow];

  Developer -> GitHub;

  GitHub -> GitHubActions;

  GitHubActions -> Terraform;

  Terraform -> RemoteState;

  Terraform -> EC2;

  GitHubActions -> DockerHub;

  DockerHub -> DockerDeploy;

  DockerDeploy -> EC2;

  EC2 -> Container;

  Terraform -> Route53;

  Route53 -> Domain;

  Domain -> Browser;

  Container -> Browser;
}
```
![Diagram Source Codes](screenshots/diagram-source-codes.png)

Generate architecture image:

```bash
dot -Tpng docs/architecture.dot -o docs/architecture-diagram.png
```

Open image:

```bash
open docs/architecture-diagram.png
```
![Architecture Diagram](docs/architecture-diagram.png)
---

# =====================================================================================================================
# ⚙️ STEP 28 — INITIALIZE TERRAFORM
# =====================================================================================================================

1. Navigate:

```bash
cd terraform
```

2. Initialize:

```bash
terraform init
```
![Successful Terraform Initialization with terraform init](screenshots/terraform-initialization.png)

3. Validate:

```bash
terraform validate
```
![Successful Terraform Validation](screenshots/terraform-validate.png)

4. Plan:

```bash
terraform plan -var="public_key=$(cat ~/.ssh/id_rsa.pub)"
```

---

# =====================================================================================================================
# ⚙️ STEP 29 — DEPLOY INFRASTRUCTURE
# =====================================================================================================================

Deploy:

```bash
terraform apply -var="public_key=$(cat ~/.ssh/id_rsa.pub)"
```

Type:

```text
yes
```

Terraform automatically:

✔ Creates EC2  
✔ Creates Security Group  
✔ Creates AWS Key Pair  
✔ Creates Route53 DNS Record  
✔ Generates Dynamic Public IP  
✔ Updates Domain Automatically  

---

# =====================================================================================================================
# ⚙️ STEP 30 — VERIFY DOMAIN
# =====================================================================================================================

1. Open browser:

```text
http://auemeribetech.com.ng:3000
```

2. Expected:

```text
🚀 Dynamic Infrastructure Recovery Pipeline Active!
```
![Domain Verification Using Browser](screenshots/domain-verification-using-browser.png)

3. Test health endpoint:

```bash
curl http://auemeribetech.com.ng:3000/health
```

Expected:

```json
{
  "status": "OK",
  "recovery_mode": "ENABLED"
}
```
![Health Endpoint Test](screenshots/health-endpoint-test.png)
---

# =====================================================================================================================
# ⚙️ STEP 31 — CONFIGURE GITHUB
# =====================================================================================================================

1. Authenticate GitHub CLI:

```bash
gh auth login
```
![GitHub CLI Authentication](screenshots/github-cli-authentication.png)

2. Initialize Git:

```bash
git init
```

Add files:

```bash
git add .
```

Commit:

```bash
git commit -m "Initial enterprise recovery architecture"
```

Rename branch:

```bash
git branch -M main
```

Create GitHub repository:

```bash
gh repo create containerized-app-terraform-cicd --public --source=. --remote=origin --push
```

---

# =====================================================================================================================
# ⚙️ STEP 32 — CONFIGURE GITHUB SECRETS
# =====================================================================================================================

1. Set AWS Access Key:

```bash
gh secret set AWS_ACCESS_KEY_ID
```
![AWS Access Key Configuration on Github Secret](screenshots/gh-configuration-aws-access-key-id.png)

2. Set AWS Secret Key:

```bash
gh secret set AWS_SECRET_ACCESS_KEY
```
![AWS Secret Key Configuration on Github Secret](screenshots/gh-configuration-aws-secret-key.png)

3. Set Docker Username:
a. Retrieve your dockerhub username using the following:
```text
i. Go to Docker Hub
ii. Log in
iii. Click your profile icon (top right)
iv. You'll see your username there, or in the URL: https://hub.docker.com/u/YOUR_USERNAME
```
b. Set using:
```bash
gh secret set DOCKER_USERNAME
```
![DockerHub Username Configuration on Github Secret](screenshots/gh-configuration-dockerhub-username.png)

4. Set Docker Password:
a. Retrieve your generated token using the following:
```text
i. Go to: https://app.docker.com/accounts/your_docker_hub_username/settings/personal-access-tokens/
ii. Click "Generate new token
iii. Select: repo
iv. Copy the token

# Alternatively,
i.   Go to Docker Hub
ii.  Click Account Settings
iii. Go to Security → Access Tokens
iv.  Click New Access Token
```
b. Set using:
```bash
gh secret set DOCKER_PASSWORD
```
![Dockerhub Password Configuration on Github Secret](screenshots/gh-configuration-dockerhub-password.png)

5. Set EC2 Public SSH Key:

```bash
gh secret set VM_PUBLIC_KEY < ~/.ssh/id_rsa.pub
```
![EC2 Public SSH Key Configuration](screenshots/gh-configuration-vm-public-key.png)

6. Set EC2 Private SSH Key:

```bash
gh secret set VM_SSH_KEY < ~/.ssh/id_rsa
```
![EC2 Private SSH Key Configuration](screenshots/gh-configuration-vm-private-key.png)

7. Verify secrets:

```bash
gh secret list
```

Expected:

```text
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
DOCKER_USERNAME
DOCKER_PASSWORD
VM_PUBLIC_KEY
VM_SSH_KEY
```
![GitHub Configured Secrets](screenshots/gh-configured-secrets.png)
---

# =====================================================================================================================
# ⚙️ STEP 33 — TEST GITHUB ACTIONS PIPELINE
# =====================================================================================================================

Trigger pipeline:

```bash
git commit --allow-empty -m "trigger recovery pipeline"
```

Push:

```bash
git push
```

GitHub Actions automatically:

✔ Builds Docker image  
✔ Pushes image to Docker Hub  
✔ Creates infrastructure  
✔ Generates NEW public IP  
✔ Updates Route53 automatically  
✔ Deploys application automatically  
✔ Restores domain automatically  

---

# =====================================================================================================================
# ⚙️ STEP 34 — VERIFY LIVE DOMAIN
# =====================================================================================================================

Open browser:

```text
http://auemeribetech.com.ng:3000
```

Expected:

```text
🚀 Dynamic Infrastructure Recovery Pipeline Active!
```

---

# =====================================================================================================================
# ⚙️ STEP 35 — DESTROY INFRASTRUCTURE
# =====================================================================================================================

Navigate:

```bash
cd terraform
```

Initialize:

```bash
terraform init
```

Destroy:

```bash
terraform destroy -auto-approve -var="public_key=$(cat ~/.ssh/id_rsa.pub)"
```
![Elimination of AWS Infrastructure Using Terraform Destroy](screenshots/terraform-destroy.png)

Removes:

✔ EC2  
✔ Security Groups  
✔ Route53 A Record  
✔ AWS Key Pairs  

---

# =====================================================================================================================
# ⚙️ STEP 36 — REACTIVATE INFRASTRUCTURE
# =====================================================================================================================

Trigger pipeline again:

```bash
git add .
git commit --allow-empty -m "reactivate infrastructure"
```

Push:

```bash
git push
```

GitHub Actions automatically:

✔ Creates NEW EC2  
✔ Generates NEW Public IP  
✔ Updates Route53 Automatically  
✔ Deploys Docker Container  
✔ Restores Domain Automatically  

---

# =====================================================================================================================
# ⚙️ STEP 37 — VERIFY AUTOMATIC DOMAIN RECOVERY
# =====================================================================================================================

Open browser:

```text
http://auemeribetech.com.ng:3000
```

Expected:

```text
🚀 Dynamic Infrastructure Recovery Pipeline Active!
```

---

# =====================================================================================================================
# 🧠 TYPICAL RECOVERY TIME
# =====================================================================================================================

```text
EC2 Creation             → 30–90 seconds
Docker Installation      → 30–120 seconds
GitHub Deployment        → 20–60 seconds
Route53 DNS Update       → 10–60 seconds
DNS Propagation          → 30 seconds – 5 minutes
Fully Live               → ~2–6 minutes
```

---

# =====================================================================================================================
# 🏁 FINAL PROJECT OUTCOME
# =====================================================================================================================

You now have:

✔ Enterprise CI/CD Pipeline  
✔ Terraform Infrastructure Automation  
✔ Dynamic EC2 Recovery  
✔ Automatic Route53 DNS Recovery  
✔ Dockerized Deployment  
✔ GitHub Actions CI/CD  
✔ Remote Terraform State  
✔ Infrastructure Recovery Engineering  
✔ Ephemeral Infrastructure  
✔ Dynamic Public IP Recovery  
✔ Zero Idle AWS Cost Architecture  
✔ Self-Healing Cloud Infrastructure  
✔ Automatic Domain Restoration  
✔ Enterprise Disaster Recovery Workflow  

---

# =====================================================================================================================
# 🚀 FINAL ENTERPRISE RECOVERY FLOW
# =====================================================================================================================

```text
terraform destroy
       ↓
Infrastructure Removed
       ↓
Zero AWS Cost
       ↓
git push
       ↓
GitHub Actions Trigger
       ↓
Terraform Apply
       ↓
Remote State Recovery
       ↓
New EC2 Created
       ↓
New Public IP Generated
       ↓
Route53 DNS Updated Automatically
       ↓
Docker Container Redeployed
       ↓
auemeribetech.com.ng Live Again
```

---

# =====================================================================================================================
# 🚀 PROJECT COMPLETE
# =====================================================================================================================