# we are extending everything from tomcat:8.0 image ...
##Remember to package application with maven before running file.
FROM tomcat:latest
MAINTAINER your_name
# COPY path-to-your-application-war path-to-webapps-in-docker-tomcat
COPY target/bacit-web-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/

## To build image: docker image build -t trym/tomcat .
##to start container: docker container run -it --publish 8081:8080 trym/tomcat
### application now accessible on http://localhost:8081/bacit-web-1.0-SNAPSHOT/
### start mariadb docker run --rm --name mariadb -p 3308:3306/tcp -v "$(pwd)/database":/var/lib/mysql -e MYSQL_ROOT_PASSWORD=12345 -d mariadb