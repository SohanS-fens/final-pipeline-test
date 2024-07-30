pipeline {
    agent any
    
    environment {
        // AWS_CREDENTIALS_ID = credentials('ca1597ac-93e6-4c28-9fa5-27d8b5812e5a')
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {

        stage('Run Script') {
            steps {
                script {
                   bat "script.sh 0 apply"
                }
            }
        }
    }
}