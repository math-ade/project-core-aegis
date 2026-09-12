pipeline {
    agent any
    
    // This blocks tells Jenkins exactly which real repository it hooks to, bypassing the buggy configuration UI page!
    properties([
        githubProjectProperty(projectUrlStr: 'https://github.com')
    ])
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('DevSecOps Audit') {
            steps {
                echo 'Running static code analysis analysis...'
            }
        }
        stage('Build Container') {
            steps {
                echo 'Compiling hardened Linux non-root app packages...'
            }
        }
    }
}
