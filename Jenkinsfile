pipeline {
    agent { label 'Functional' }

    parameters {
        string(defaultValue: 'develop', description: '', name: 'LA_BRANCH')
        string(defaultValue: 'develop', description: '', name: 'UM_BRANCH')
        string(defaultValue: 'develop', description: '', name: 'BB_BRANCH')
        string(defaultValue: 'develop', description: '', name: 'AP_BRANCH')
        string(defaultValue: 'develop', description: '', name: 'AZ_BRANCH')
        string(defaultValue: 'develop', description: '', name: 'MG_BRANCH')
        string(defaultValue: 'develop', description: '', name: 'RD_BRANCH')
        string(defaultValue: 'develop', description: '', name: 'CA_BRANCH')
    }

    environment {
        LA_BRANCH="${params.LA_BRANCH}"
        UM_BRANCH="${params.UM_BRANCH}"
        BB_BRANCH="${params.BB_BRANCH}"
        AP_BRANCH="${params.AP_BRANCH}"
        AZ_BRANCH="${params.AZ_BRANCH}"
        MG_BRANCH="${params.MG_BRANCH}"
        RD_BRANCH="${params.RD_BRANCH}"
        CA_BRANCH="${params.CA_BRANCH}"

        GITHUB_TOKEN=credentials('GITHUB_TOKEN')
     }

    stages {
        stage('Clone the applications') {
            steps {
                sh 'bash run-setup-dev-env.sh'
                sh 'bash run-clone-sources.sh'
            } 
        }
    
        stage('Create Env Feature File') {
           steps {
            sh 'bash run-compute-versions.sh'
            sh 'bash run-build-env-feature-file.sh' 
            sh 'ls -la'
            stash includes: 'dev-env/**/*', name: 'dev-env' 
            stash includes: 'la-webapp/**/*', name: 'la-webapp'
            stash includes: 'applications-service/**/*', name: 'applications-service'
            stash includes: 'badgemanagement-service/**/*', name: 'badgemanagement-service'
            stash includes: 'authorisation-service/**/*', name: 'authorisation-service'
            stash includes: 'message-service/**/*', name: 'message-service'
            stash includes: 'referencedata-service/**/*', name: 'referencedata-service'
            stash includes: 'usermanagement-service/**/*', name: 'usermanagement-service'
           }  
        }

        stage('Start dev-env') {
            steps {
                echo "LA_BRANCH: ${env.LA_BRANCH}"
                echo "UM_BRANCH: ${env.UM_BRANCH}"
                echo "BB_BRANCH: ${env.BB_BRANCH}"
                echo "AP_BRANCH: ${env.AP_BRANCH}"
                echo "AZ_BRANCH: ${env.AZ_BRANCH}"
                echo "MG_BRANCH: ${env.MG_BRANCH}"
                echo "RD_BRANCH: ${env.RD_BRANCH}"
                echo "CA_BRANCH: ${env.CA_BRANCH}"

                dir('dev-env'){
                    unstash 'dev-env'
                }

                sh 'bash run-start-services.sh' 
                
            }
        }

        stage('Run Acceptance Tests') {
            steps {
                unstash 'la-webapp'
                sh 'bash run-acceptance-tests-for.sh la-webapp'

                unstash 'applications-service'
                sh 'bash run-acceptance-tests-for.sh applications-service'

                unstash 'badgemanagement-service'
                sh 'bash run-acceptance-tests-for.sh badgemanagement-service'

                unstash 'authorisation-service'
                sh 'bash run-acceptance-tests-for.sh authorisation-service'

                unstash 'message-service'
                sh 'bash run-acceptance-tests-for.sh message-service'

                unstash 'referencedata-service'
                sh 'bash run-acceptance-tests-for.sh referencedata-service'

                unstash 'usermanagement-service'
                sh 'bash run-acceptance-tests-for.sh usermanagement-service'
            }
        }
    }

    post {
        always {
            dir('dev-env'){
                unstash 'dev-env'
            }

            sh 'bash cleanup.sh' 
            deleteDir()
        }
        success {
            echo 'I succeeeded!'
        }
        unstable {
            echo 'I am unstable :/'
        }
        failure {
            echo 'I failed :('
        }
        changed {
            echo 'Things were different before...'
        }
    }
}
