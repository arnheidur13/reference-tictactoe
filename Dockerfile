# From what image we want to build from
FROM node
# Directory to hold application code inside the image
# Working directory for application
WORKDIR /code
# Install app dependencies
COPY package.json .
RUN npm install --silent
WORKDIR ./code/build
# App binds to port 3000, mapped by the docker daemon
EXPOSE 3000
# Define the command to run your ass using CMD *defines runtime. 
CMD ./fix.sh
