pipeline {
    agent any
    
    environment {
        AWS_CREDENTIALS_ID = credentials('ca1597ac-93e6-4c28-9fa5-27d8b5812e5a')
    }

    stages {

        stage('Run Script') {
            steps {
                script {
                    // Check if the script exists
                    if (fileExists('script.sh')) {
                        // Execute the Bash script using Git Bash
                        bat '"C:\\Program Files\\Git\\bin\\bash.exe" -c "bash script.sh 0 apply"'
                    } else {
                        error 'script.sh not found'
                    }
                }
            }
        }
    }
}