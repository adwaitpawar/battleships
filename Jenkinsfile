pipeline {
    agent any
    
    stages {
        stage('Record Trigger Branch') {
            steps {
                script {
                    // Record the name of the branch that triggered the pipeline
                    def triggerBranch = env.CHANGE_BRANCH ?: 'master'
                    echo "Triggered by branch: ${triggerBranch}"
                    
                    // You can save this information to a file, send it to an external system,
                    // or use it for any other purpose as needed in your pipeline
                    writeFile file: 'trigger_branch.txt', text: "${triggerBranch}"
                }
            }
        }
        
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub for specific branches
                checkout([$class: 'GitSCM', branches: [[name: 'refs/heads/master'], [name: 'refs/heads/dev']], userRemoteConfigs: [[url: 'https://github.com/adwaitpawar/battleships.git']]])

            }
        }
        
        stage('Print Workspace') {
            steps {
                echo "Workspace contents:"
                sh "ls -la"
            }
        }
        
        stage('Install Dependencies') {
            steps {
                // Install npm dependencies
                sh 'npm install'
            }
        }
        
        stage('Build') {
            steps {
                echo "Building on ${params.ENVIRONMENT} environment"
                sh "echo ENVIRONMENT: ${params.ENVIRONMENT}"
                    
                // Run Webpack to bundle the application
                sh 'webpack --config webpack.config.js'
            }
        }
        
        stage('Test') {
            steps {
                // Run tests if applicable
                sh 'npm test'
            }
        }
        
        stage('Build Image through Kaniko') {
            steps {
                echo "Build Image through Kaniko"
                // Add Kaniko build steps here
            }
        }
        
        stage('Push Artifact to Nexus Repo') {
            steps {
                echo "Push Artifact to Nexus Repo"
                // Add Nexus artifact push steps here
            }
        }
        
        stage('Deployment in EKS through Helm') {
            steps {
                echo "Current branch name: ${env.BRANCH_NAME}"
                echo "Deployment in EKS through Helm"
                // Add deployment steps here
            }
        }
    }
}
