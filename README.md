This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

# Wtf is this?
Just a boilerplate create react app that will be used for purpose of dev ops including: Docker, AWS and CircleCI

## Docker

To build the docker image use: docker build -t "devops-createreactapp" .
To run the docker image use: docker run -it -p 5003:5003 devops-createreactapp:latest

## AWS Amplify 

This create react app is hosted on AWS Amplify with the docker file being used for the deployment and hosting of the app