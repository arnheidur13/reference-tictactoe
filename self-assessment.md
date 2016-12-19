###### Arnheiður Aldís Sigurðardóttir <arnheidur13@ru.is>

# Final Assignment

You turn in the url to your Git repository. You must create a file named self-assessment.md in the root folder of the project and answer the following self assessment questions (copy md format below and use as a base and keep the structure). You need to give hap2000 access to the repository, make sure that hap2000 has commit/push access.

1. [Jenkins URL "Click to open Jenkins"](http://82.221.49.117:8080) 

2. [Game URL (AWS) "Click to open AWS"](http://ec2-35-162-181-184.us-west-2.compute.amazonaws.com/)

## Scripts

Outline what script files you created and the purpose of each file. Each file should be commented. This could be

* [Docker build](http://github.com/arnheidur13/reference-tictactoe/blob/master/buildDocker.sh)
..* Builds the Docker image and captures the docker image tag in .env file, pushes to docker-hub so that docker-compose
    can later use it. It also copies all necessary files to build directory in order to run the project (docker-compose up) 

* [Docker compose](http://github.com/arnheidur13/reference-tictactoe/blob/master/docker-compose.yml)
..* Docker-compose allows the image pulled from Docker Hub and postgres to run alongside. It declares
    what ports and environment to run in, which were different from running in production og development. 

* [AWS Provisioning](http://github.com/arnheidur13/reference-tictactoe/blob/master/deployment.sh)
..* This is mainly built to run on Deploy stage from Jenkins, and will securely copy docker-compose and the most recent .env file
    to the AWS EC2 machine. From there it will run docker-compose up so TicTacToe is running on it's dns address. 

* [Docker Cleaner](http://github.com/arnheidur13/reference-tictactoe/blob/master/dockerCleaner.sh)
..* Will stop all running docker containers and delete them, as well for docker images.

* [Run Server script](https://github.com/arnheidur13/reference-tictactoe/blob/master/runserver.sh)
..* Script that is executed from Dockerfile to run migratedb.

## Testing & logic

Outline what tests you created.

* UnitTests, server logic TDD (Git commit log)

* API Acceptance test - fluent API:: None

* Load test loop: None

* UI TDD
1. Create game command
 ..* should emit game created event

2.Join game command
 ..* should emit game joined event
 ..* should emit FullGameJoinAttempted when game full

* Is the game playable? Not that I know of.

## Data migration

Did you create a data migration.

* Migration up and down: Just some adjustments to migration scripts in package.json. Spent a lot of time to try and figure out 
the missing column thingy, didn't work. 

## Jenkins

Do you have the following Jobs and what happens in each Job:

* Commit Stage: It runs the build script and triggers Deploy Stage. 

* Acceptance Stage: No.

* Capacity Stage: No.

* Deploy Stage: It runs as soon as Commit is successfully built and connects to AWS.  

## Did you use any of the following features in Jenkins?

* Schedule or commit hooks: I created a webhook in GitHub so that every push will trigger Commit to fetch the most recent changes
and run build. 

* Pipeline: I had installed the Pipeline plugin, but didn't use it.

* Jenkins file: Not sure what files are being referred to. 

* Test reports: None.

* Other: A lot of interesting plugins that would have been handy, but I didn't want to risk to piss off Jenkins.  

## Monitoring

Did you do any monitoring? No. 

* URL to monitoring tool. Must be open or include username and pass.

## Other

Anything else you did to improve you deployment pipeline of the project itself? No. 

