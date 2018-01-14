FROM alpine:3.6

# Set the timezone
ENV TIMEZONE            America/New_York

# Load ash profile on launch
ENV ENV="/etc/profile"

# Setup ash profile prompt and my old man alias
# Create work directory
RUN mv /etc/profile.d/color_prompt /etc/profile.d/color_prompt.sh && \
	echo alias dir=\'ls -alh --color\' >> /etc/profile && \
	mkdir -p /app /run/nginx /run/php7

# install php7-fpm and a db extension
# Python 3
# apk uwsgi uwsgi-python3
# pip install gunicorn flask
#
#

RUN apk --update --no-cache add git dumb-init tzdata supervisor \
	nginx python py2-pip && \
	cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
	echo "${TIMEZONE}" > /etc/timezone && \
	apk del tzdata

RUN pip install gunicorn flask

# setup our working directory
WORKDIR /app

COPY ./code/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ./code .

# expose our service port
EXPOSE 80

# start with our PID 1 controller
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# what we use to start the container
# CMD ["/bin/sh", "-c", "php-fpm7 --daemonize && nginx -g \"daemon off;\""]
