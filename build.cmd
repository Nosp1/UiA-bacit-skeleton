@echo off

:: Kill running instance of tomcat
docker kill tomcat

:: Compiles and packages source code into .war file via maven volume in docker container
docker run --rm -it --name mavenbuild -v maven-repo:/root/.m2 -v "%cd%":/usr/src/mymaven -w /usr/src/mymaven maven mvn clean install

:: Copies and rebuilds tomcat image with latest .war file
docker image build -t gruppe9/tomcat .

:: Starts tomcat container, making the webapp available.
docker container run --rm -it -d --name tomcat --publish 8081:8080 gruppe9/tomcat

echo.
echo "Link: http://localhost:8081/bacit-web-1.0-SNAPSHOT/login"
echo.

pause
