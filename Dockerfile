############################################
# Dockerfile to build container images
############################################

# From what image we want to build from
FROM node
# File Author / Maintainer
MAINTAINER "arnheidur13"

############################################

# Directory to hold application code inside 
# the image. Working directory for application
WORKDIR /code

# Copy dependencies to working directory=build
COPY package.json .
COPY . .

# Installing app depencies and copy to build
# directory
RUN npm install --silent

# App binds to port 3000, mapped by the 
# docker daemon, application can be accessed
# on localhost:3000
EXPOSE 3000

# Sets the path to the directory that node should
# be running scripts and applications from. 
ENV NODE_PATH .

# Define the command to run your app 
# CMD ["sleep", "10", "npm", "run", "migratedb", "node", "run.js"]
CMD ["./runMigrate.sh"]

#############################################
# Created .dockerignore file to ignore 
# node_modules and npm-log files
