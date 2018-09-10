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
        LA_BRANCH='${params.LA_BRANCH}'
        UM_BRANCH='${params.UM_BRANCH}'
        BB_BRANCH='${params.BB_BRANCH}'
        AP_BRANCH='${params.AP_BRANCH}'
        AZ_BRANCH='${params.AZ_BRANCH}'
        MG_BRANCH='${params.MG_BRANCH}'
        RD_BRANCH='${params.RD_BRANCH}'
        CA_BRANCH='${params.CA_BRANCH}'
     }

    stages {
        stage('Start Services) {
            steps {
                git(
                   url: "https://github.com/uk-gov-dft/dev-env.git",
                   credentialsId: 'dft-buildbot-valtech',
                   branch: "develop"
                )
                dir('dev-env') {
                    sh 'bash run-start-services.sh'
                }
            }
        }
        stage('Acceptance Tests') {
            steps {
                echo 'LA_BRANCH: ${env.LA_BRANCH}'
                echo 'UM_BRANCH: ${env.UM_BRANCH}'
                echo 'BB_BRANCH: ${env.BB_BRANCH}'
                echo 'AP_BRANCH: ${env.AP_BRANCH}'
                echo 'AZ_BRANCH: ${env.AZ_BRANCH}'
                echo 'MG_BRANCH: ${env.MG_BRANCH}'
                echo 'RD_BRANCH: ${env.RD_BRANCH}'
                echo 'CA_BRANCH: ${env.CA_BRANCH}'

                dir('dev-env') {
                    sh 'docker-compose ps'
                }
            }
        }
    }

    post {
        always {
            dir('dev-env') {
                sh 'bash cleanup.sh'
            }
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
