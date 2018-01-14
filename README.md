# cx2-webapp
Quick and dirty Alpine/Nginx/PHP7fpm server and pages for my cx2 skeleton project

Want to docker build it manually?  cool..

**build it**
`docker build -t webapp .`

**run it**
`docker run --name webapp_test --rm -id webapp`

**connect to it**
`docker exec -it webapp_test /bin/sh`

**kill it**
`docker kill webapp_test`
