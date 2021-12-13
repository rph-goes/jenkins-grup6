FROM tomcat:8
LABEL app=jenkins-grup6
COPY target/*.war /usr/local/tomcat/webapps/jenkins-grup6.war