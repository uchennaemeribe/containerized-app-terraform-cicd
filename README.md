🚀 DevOps Capstone Project

📌 Overview

This project demonstrates a production-style DevOps pipeline that automates:
	•	Application containerization using Docker
	•	Infrastructure provisioning using Terraform
	•	Continuous Integration & Deployment using GitHub Actions
	•	Deployment to AWS EC2

🧠 Architecture

Developer → GitHub → GitHub Actions → Docker Hub → EC2 → Docker Container → Browser

📂 Project Structure

devops-capstone-project/
│
├── .github/
│   └── workflows/
│       └── deploy.yml        # (CI/CD pipeline)
│
├── devops-app/
│   ├── app.js
│   ├── package.json
│   └── Dockerfile           # (app build context)
│
├── devops-terraform/
│   ├── main.tf
│   └── providers.tf
│
├── .gitignore               # (global ignore rules)
├── README.md                # (project documentation)


🐳 Docker

The application is containerized using Docker.

Build locally:

docker build -t devops-app ./devops-app

Run locally:

docker run -p 3000:3000 devops-app

⚙️ CI/CD Pipeline

The pipeline automatically:
	1.	Builds Docker image
	2.	Pushes image to Docker Hub
	3.	Connects to EC2 via SSH
	4.	Deploys the latest container

Trigger:

git push → automatic deployment

☁️ Infrastructure (Terraform)

Terraform provisions:
	•	AWS EC2 instance (Ubuntu)
	•	Security Group (Ports 22 & 80)

Commands:

terraform init
terraform apply

🌐 Live Application

The application is deployed on AWS EC2 and accessible via:

http://18.206.238.63

🔐 Security

Sensitive data is stored using GitHub Secrets:
	•	DOCKER_USERNAME
	•	DOCKER_PASSWORD
	•	EC2_HOST
	•	EC2_KEY

🚀 Deployment Strategy

The system uses a replace-based deployment:
	•	Pull latest image
	•	Stop old container
	•	Run new container

🧠 Key DevOps Principles
	•	Infrastructure as Code
	•	Automation
	•	Containerization
	•	Continuous Deployment
	•	Separation of concerns

🏁 Outcome

✔ Fully automated CI/CD pipeline
✔ Live cloud deployment
✔ Reproducible infrastructure

👨‍💻 Author
Anthony Uchenna Emeribe