############################################
# Dockerfile to build container images
############################################

# From what image we want to build from
FROM node
# File Author / Maintainer
MAINTAINER "arnheidur13"

############################################

# Directory to hold application code inside the image
# Working directory for application
WORKDIR /code

# Install app dependencies
COPY package.json .
COPY . .
RUN npm install --silent

WORKDIR ./code/build

# App binds to port 3000, mapped by the docker daemon
EXPOSE 3000

ENV "NODE_PATH=."

# Define the command to run your ass using CMD *defines runtime.
CMD "./fix.sh"

#############################################
# Created .dockerignore file to ignore node_modules and npm-log files
