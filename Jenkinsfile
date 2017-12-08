#!groovy
node {
  
   // Mark the code checkout 'stage'....
   stage 'Checkout'

   checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'github_id', url: 'https://github.com/snyamars/wcw_micro_gateway.git']]])

   // Get the maven tool.
   // ** NOTE: This 'M3' maven tool must be configured
   // **       in the global configuration.           
   //def mvnHome = tool 'Maven'

   // Mark the code build 'stage'....
   stage 'Build'
   
   //set the version
   //sh "/usr/bin/mvn versions:set -DnewVersion=1.0.${env.BUILD_NUMBER}"
   
   // Run the maven build

   //sh "/usr/bin/mvn clean package"
   
   //sh "/usr/bin/mvn release:update-versions -DautoVersionSubmodules=true"
   //sh "${mvnHome}/bin/mvn release:prepare"
  
  stage 'tag in git'
  /**
 
  **/

  /**
   stage ('docker build'){

      withCredentials([[$class: "UsernamePasswordMultiBinding", usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS', credentialsId: 'dockerId']]) {
      sh 'docker login --username $DOCKERHUB_USER --password $DOCKERHUB_PASS'
    }
    def serverImage = docker.build('snyamars007/micro_gateway')
    serverImage.push('latest')
    sh 'docker logout'
   }
  **/
   
   stage 'notifyKubernetes'
     try{
      sh "kubectl delete deployment micro_gateway"
   }catch(e){
      println("no prior deployment exists")
   }
   sh "sleep 3s"
   sh "kubectl run --image=snyamars007/micro_gateway:latest microgateway1  --port=3406"
   sh "kubectl expose deployment microgateway1 --type=NodePort "

}//end of node
