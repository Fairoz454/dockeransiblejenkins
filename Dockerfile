FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY target/*.jar /usr/local/tomcat/webapps/my-app-1.1.jar
