docker run --rm --env "TZ=Europe/Oslo" --name mariadb -p 3308:3306/tcp -v "%cd%\database":/var/lib/mysql -e MYSQL_ROOT_PASSWORD=TestTest123 -d mariadb:latest
