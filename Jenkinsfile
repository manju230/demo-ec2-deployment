pipeline {

    agent any

    environment {
        AWS_REGION = 'ap-south-1'
    }

    stages {

        stage('Checkout Develop Branch') {
            steps {
                git branch: 'develop', url: 'https://github.com/manju230/demo-ec2-deployment.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
                
                // Clean readable output
                sh 'terraform show -no-color tfplan > plan.txt'
            }
        }

        stage('Archive Plan') {
            steps {
                archiveArtifacts artifacts: 'plan.txt', fingerprint: true
            }
        }

        // Optional approval step
        stage('Approval') {
            steps {
                input message: 'Approve Terraform Apply?', ok: 'Approve'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }

    }
}
