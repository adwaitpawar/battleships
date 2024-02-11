pipeline {
  agent any

  stages {
    // Record the triggering branch (adjusted to use env.BRANCH_NAME)
    stage('Record Trigger Branch') {
      steps {
        script {
          def triggerBranch = env.BRANCH_NAME
          echo "Triggered by branch: ${triggerBranch}"

          // Use or save the branch name here as needed
          writeFile file: 'trigger_branch.txt', text: "${triggerBranch}"
        }
      }
    }

    // Checkout code for all branches (no filtering)
   // stage('Checkout') {
     // steps {
       // checkout([$class: 'GitSCM', userRemoteConfigs: [[url: 'https://github.com/adwaitpawar/battleships.git']]])
    //  }
   // }

    // Print workspace contents (optional)
    stage('Print Workspace (Optional)') {
      when {
        expression {
          // Only run this stage if you need to see workspace contents
          return params.PRINT_WORKSPACE
        }
      }
      steps {
        echo "Workspace contents:"
        sh "ls -la"
      }
    }

    // Install dependencies
    stage('Install Dependencies') {
      steps {
        sh 'npm install'
      }
    }

    // Build using environment parameter
    stage('Build') {
      steps {
        echo "Building on ${params.ENVIRONMENT} environment"
        sh "echo ENVIRONMENT: ${params.ENVIRONMENT}"

        sh 'webpack --config webpack.config.js'
      }
    }

    // Run tests (if applicable)
    stage('Test') {
      steps {
        sh 'npm test'
      }
    }

    // Build image with Kaniko (add steps here)
    stage('Build Image through Kaniko') {
      steps {
        // Add your Kaniko build steps here
      }
    }

    // Push artifact to Nexus repository (add steps here)
    stage('Push Artifact to Nexus Repo') {
      steps {
        // Add your Nexus artifact push steps here
      }
    }

    // Deployment in EKS with Helm (add steps here)
    stage('Deployment in EKS through Helm') {
      steps {
        echo "Current branch name: ${env.BRANCH_NAME}"
        echo "Deployment in EKS through Helm"
        // Add your Helm deployment steps here
      }
    }
  }

  // Optional parameters for environment and printing workspace contents
  parameters {
    booleanParam(name: 'PRINT_WORKSPACE', defaultValue: false, description: 'Print workspace contents?')
    choiceParam(name: 'ENVIRONMENT', choices: ['development', 'staging', 'production'], description: 'Build environment')
  }
}
