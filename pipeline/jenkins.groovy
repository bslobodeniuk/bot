pipeline {
    agent any

    parameters {
        string(name: 'TARGET_BRANCH', defaultValue: 'main', description: 'Target branch to build')
        string(name: 'BUILD_ENV', defaultValue: 'prod', description: 'Build environment')
        // Add additional parameters here
    }

    stages {
        stage('Preparation') {
            steps {
                checkout scm
                script {
                    // Preparation logic, for example, determining the version
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    // Commands for building
                    echo "Building for branch: ${params.TARGET_BRANCH} in ${params.BUILD_ENV} environment"
                    // Use TARGET_BRANCH and BUILD_ENV parameters here
                }
            }
        }
        stage('Test') {
            steps {
                // Commands for testing
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Conditions or commands for deployment
                    echo "Deploying to ${params.BUILD_ENV} environment"
                    // Use BUILD_ENV parameter here
                }
            }
        }
        // Add additional stages here
    }
    post {
        always {
            // Commands that will be executed after each build
        }
    }
}
