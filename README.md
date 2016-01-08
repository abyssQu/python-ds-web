## python-ds-web

Repository for creating a docker image with python webstack for data science.

- Python web stack
	- Nginx
	- Gunicorn 
	- Flask
	- SQL ORM support

- Python data science stack
	- Numpy
	- Scipy
	- Panda
	- Theano
	- nltk

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/abyssqu/python-ds-web/) from public [Docker Hub Registry](https://registry.hub.docker.com/):

```bash
docker pull abyssqu/python-ds-web
```


### Usage

```bash
docker run -d -p 80:80 abyssqu/python-ds-web
```

After few seconds, open `http://<host>` to see the Flask app.
