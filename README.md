# service-flask
Quick and dirty nginx/gunicorn/python2 docker image

## Assumptions
- you have docker installed
- you have make tools
- you like lists

## How to
- Put your app in `./code`
- Use the `Makefile` with `make` (will display helps)

## Want to build it manually?  cool, cool..

- **build it**  
`docker build --pull -t flaskapp .`

- **run it on port 80**  
`docker run -p 80:80 --name flaskapp_run --rm -id flaskapp`

- **run it on port 80, but also mount the ./code directory so you can make live edits**  
`docker run -p 80:80 --name flaskapp_run -v ${PWD}/code:/app --rm -id flaskapp`  
**NOTE**: *You'll have to rebuild the docker image after you're done making changes if you want the image to have your new codebase.*

- **connect to it while it's running**  
`docker exec -it flaskapp_run /bin/sh`

- **watch the pretty logs**  
`docker logs -f flaskapp_run`

- **kill it**  
`docker kill flaskapp_run`

There are other options in the `Makefile` too, so really, use that.
