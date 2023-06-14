# tomcat_docker
1. create my sql database using this cmd 
  
  docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=123456789 -d mysql

2. After this step ,edit file.txt and enter username and password with mysql container endpoint 
3. then run docker file
      docker run -itd --name Tomcatcontainer -p 8080:8080 < container ID or name > 

      
