FROM ubuntu
RUN apt update -y
RUN apt install openjdk-11-jre-headless -y
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.89/bin/apache-tomcat-8.5.89.tar.gz /opt/
RUN tar -xvf /opt/apache-tomcat-8.5.89.tar.gz -C /opt/
COPY file.txt /opt
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war /opt/apache-tomcat-8.5.89/webapps/
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar /opt/apache-tomcat-8.5.89/lib/
RUN sed '20r /opt/file.txt' /opt/apache-tomcat-8.5.89/conf/context.xml > /opt/apache-tomcat-8.5.89/conf/context_modified.xml && mv /opt/apache-tomcat-8.5.89/conf/context_modified.xml /opt/apache-tomcat-8.5.89/conf/context.xml
EXPOSE 8080
CMD ["/opt/apache-tomcat-8.5.89/bin/catalina.sh", "run"]
