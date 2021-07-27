#Java base skeleton for web application
This application uses Docker to manage maven, tomcat and mariadb to build and host a web application using Java.
It should serve as a base for further development throughout the course.

##Notice
Please read and understand how the dockerfile works. 
Understand that all scripts used (build.sh & startDb.sh) can be run in the terminal without the scripts.
I recommend getting familiar with executing docker commands in the terminal before using the scripts.
##How to use:
### to learn commandline with docker :) 
compile and pacakge source code with maven in docker.
1. docker run --rm -it --name mavenbuild -v maven-repo:/root/.m2 -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven maven mvn clean install
copy compiled source code into tomcat docker container. 
2. docker image build -t trym/tomcat .
Starts docker container with the web application.   
3. docker container run --rm -it --publish 8081:8080 trym/tomcat
Starts a mariadb container using the localdirectory "database" to store the data.   
4. docker run --rm --name mariadb -p 3308:3306/tcp -v "$(pwd)/database":/var/lib/mysql -e MYSQL_ROOT_PASSWORD=12345 -d mariadb


###Running with scripts
The following takes the above steps and deduce them into scripts. (all the above commands are present in the below scripts).
The scripts allow us to build and deploy our application faster, which can be beneficial when the core concepts of using docker are understood.
1. run build.sh to compile source code and build tomcat docker image.
2. run startDb.sh to start database

####PS
Remember to recompile your code with maven after code changes. :)
Have fun and experiment :)
