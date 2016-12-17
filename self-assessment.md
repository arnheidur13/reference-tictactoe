###### Arnheiður Aldís Sigurðardóttir <arnheidur13@ru.is>

# Final Assignment

You turn in the url to your Git repository. You must create a file named self-assessment.md in the root folder of the project and answer the following self assessment questions (copy md format below and use as a base and keep the structure). You need to give hap2000 access to the repository, make sure that hap2000 has commit/push access.

1. [Jenkins URL](http://82.221.49.117:8080) and username and password.

2. [Game URL (AWS)](http://ec2-35-162-181-184.us-west-2.compute.amazonaws.com/)

## Scripts

Outline what script files you created and the purpose of each file. Each file should be commented. This could be

* [Docker build](http://github.com/arnheidur13/reference-tictactoe/blob/master/buildDocker.sh)

* [Docker compose](http://github.com/arnheidur13/reference-tictactoe/blob/master/docker-compose.yml)

* [AWS Provisioning](http://github.com/arnheidur13/reference-tictactoe/blob/master/deployment.sh)

* [Docker Cleaner "Remove/kill containers and images"](http://github.com/arnheidur13/reference-tictactoe/blob/master/dockerCleaner.sh)

## Testing & logic

Outline what tests you created.

* UnitTests, server logic TDD (Git commit log)

* API Acceptance test - fluent API

* Load test loop

* UI TDD

* Is the game playable?

## Data migration

Did you create a data migration.

* Migration up and down

## Jenkins

Do you have the following Jobs and what happens in each Job:

* Commit Stage

* Acceptance Stage

* Capacity Stage

* Other

## Did you use any of the following features in Jenkins?

* Schedule or commit hooks: GitHub webhook

* Pipeline

* Jenkins file

* Test reports

* Other

## Monitoring

Did you do any monitoring?

* URL to monitoring tool. Must be open or include username and pass.

## Other

Anything else you did to improve you deployment pipeline of the project itself?

