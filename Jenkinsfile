pipeline {
  agent any
  stages {
    stage('pull scm') {
      steps {
        echo 'pulling file'
      }
    }

    stage('deploy_dev') {
      parallel {
        stage('deploy_dev') {
          steps {
            echo 'dev success'
          }
        }

        stage('deploy_qa') {
          steps {
            echo 'QA success'
          }
        }

      }
    }

    stage('deploy_prod') {
      steps {
        echo 'Prod success'
      }
    }

  }
}