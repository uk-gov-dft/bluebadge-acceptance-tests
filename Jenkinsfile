def REPONAME = "${scm.getUserRemoteConfigs()[0].getUrl()}"

pipeline {
    agent any

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
     }

    stages {
        stage("Acceptance Tests") {
            agent {
                label 'Functional'
            }
            steps {
                git(
                     url: "${REPONAME}",
                     credentialsId: 'username***REMOVED***-github-automation-uk-gov-dft',
                     branch: "${BRANCH_NAME}"
                )
                dir ('acceptance-tests') { 
                    echo "LA_BRANCH: ${env.LA_BRANCH}"
                    echo "UM_BRANCH: ${env.UM_BRANCH}"
                    echo "BB_BRANCH: ${env.BB_BRANCH}"
                    echo "AP_BRANCH: ${env.AP_BRANCH}"
                    echo "AZ_BRANCH: ${env.AZ_BRANCH}"
                    echo "MG_BRANCH: ${env.MG_BRANCH}"
                    echo "RD_BRANCH: ${env.RD_BRANCH}"
                    echo "CA_BRANCH: ${env.CA_BRANCH}"

                    sh "run.sh"
                }
            }
        }
    }
}
