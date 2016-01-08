#python-ds-web

FROM ubuntu:14.04
MAINTAINER Yuan Qu <abyss.qu@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install python web stack
RUN apt-get update
RUN apt-get install -y python python-pip python-virtualenv nginx gunicorn supervisor

# Install python data science stack
RUN apt-get install -y build-essential python-numpy python-scipy python-dev \
		python-nose g++ gfortran libopenblas-dev python-matplotlib \
                liblapack-dev libhdf5-serial-dev
RUN pip install Theano nltk

# Setup flask application
RUN mkdir -p /deploy/app
COPY app /deploy/app
RUN pip install -r /deploy/app/requirements.txt

# Setup nginx
RUN rm /etc/nginx/sites-enabled/default
COPY flask.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/flask.conf /etc/nginx/sites-enabled/flask.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Setup supervisord
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY gunicorn.conf /etc/supervisor/conf.d/gunicorn.conf

# Start processes
CMD ["/usr/bin/supervisord"]
