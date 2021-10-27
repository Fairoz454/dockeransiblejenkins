FROM tomcat:8
# take the war copy to webapps of tomcat
COPY target/.*war .usr/local/tomcat/webapps/dockeansible.war
