
1) make a file Dockerfile

2) 
# Dockerfile

#pull base image
FROM python:3

#set environment variables 
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

#set work directory
WORKDIR /code

#Install dependencies
COPY Pipfile Pipfile.lock /code/
RUN pip install pipenv  && pipenv install --system

#Copy project
COPY . /code/

3) docker build .

4) make a file docker-compose.yml

5)
# docker-compose.yml

version: '3'

services:
  web:
    build: .
    command: python /code/manage.py runserver 0.0.0.0:8000
    volumes:
      - .:/code
    ports:
      - 8000:8000

6) docker-compose up

7) http://127.0.0.1:8000/

The general pattern will always be the same when using it with Django :

 a) create a virtual environment locally and install Django.

 b) create a new project.

 c) exit the virtual environment.

 d) write a Dockerfile and then build the initial image.

 e) write a docker-compose.yml file and run the container with docker-compose up














