# service-flask
Quick and dirty nginx => gunicorn => python2/flask docker image based on alpine 3.6

## Assumptions
- you have docker installed
- you have make tools
- you like lists

## Quick start
* do `make build`  
You should see the container build up
* do `make runvolume`
now point your browser at [http://localhost:8080/](http://localhost:8080/) and see "hello world!"
* edit the `./code/main.py` and change the `hello` to `bonjour`
now point your browser at [http://localhost:8080/](http://localhost:8080/) and see "bonjour world!".  It might take a few reloads to reflect code change, this is due to the `-reload` in the `gunicorn` command switches.
* finally `make kill` to clean it up

## How to
- Put your app in `./code`
- Use the `Makefile` with `make` (will display helps)
- the docker file assumes your app is started with "main:app" so edit this accordingly and rebuild the docker file

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
