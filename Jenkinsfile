
pipeline {
    agent any

    parameters {
        textParam(defaultValue: 'develop', description: '', name: 'LA_BRANCH')
        textParam(defaultValue: 'develop', description: '', name: 'UM_BRANCH')
        textParam(defaultValue: 'develop', description: '', name: 'BB_BRANCH')
        textParam(defaultValue: 'develop', description: '', name: 'AP_BRANCH')
        textParam(defaultValue: 'develop', description: '', name: 'AZ_BRANCH')
        textParam(defaultValue: 'develop', description: '', name: 'MG_BRANCH')
        textParam(defaultValue: 'develop', description: '', name: 'RD_BRANCH')
        textParam(defaultValue: 'develop', description: '', name: 'CA_BRANCH')
    }

    stages {
        stage("foo") {
            steps {
                echo "LA_BRANCH: ${params.LA_BRANCH}"
                echo "UM_BRANCH: ${params.UM_BRANCH}"
                echo "BB_BRANCH: ${params.BB_BRANCH}"
                echo "AP_BRANCH: ${params.AP_BRANCH}"
                echo "AZ_BRANCH: ${params.AZ_BRANCH}"
                echo "MG_BRANCH: ${params.MG_BRANCH}"
                echo "RD_BRANCH: ${params.RD_BRANCH}"
                echo "CA_BRANCH: ${params.CA_BRANCH}"
            }
        }
    }
}
