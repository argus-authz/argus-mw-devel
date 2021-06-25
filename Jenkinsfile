#!/usr/bin/env groovy

@Library('sd')_
def kubeLabel = getKubeLabel()

pipeline {

  agent {
    kubernetes {
      label "${kubeLabel}"
      cloud 'Kube mwdevel'
      defaultContainer 'runner'
      inheritFrom 'ci-template'
    }
  }

  options {
    timeout(time: 1, unit: 'HOURS')
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }

  stages {

    stage('build') {
      steps {
        dir('mwdevel_argus') {
          sh '/opt/puppetlabs/bin/puppet module build'
        }
      }
    }

    stage('archive') {
      steps {
        dir('mwdevel_argus/pkg') {
          archiveArtifacts 'mwdevel-mwdevel_argus-*.tar.gz'
        }
      }
    }
    
   stage('result') {
     steps {
       script { currentBuild.result = 'SUCCESS' }
     }
   }
 }

  post {
    unstable {
      slackSend color: 'danger', message: "${env.JOB_NAME} - #${env.BUILD_NUMBER} Unstable (<${env.BUILD_URL}|Open>)" 
    }

    failure {
      slackSend color: 'danger', message: "${env.JOB_NAME} - #${env.BUILD_NUMBER} Failure (<${env.BUILD_URL}|Open>)" 
    }

    changed {
      script{
        if('SUCCESS'.equals(currentBuild.result)) {
          slackSend color: 'good', message: "${env.JOB_NAME} - #${env.BUILD_NUMBER} Back to normal (<${env.BUILD_URL}|Open>)"
        }
      }
    }
  }
}
