Technologies Used

Ruby on Rails - Backend Development
Mysql - Database
Docker - Containerization
Kubernetes - Orchestration Tool
Google Cloud - Google Kubernetes Engine(GKE), Cloud DNS , Google Container Registry(GCR)
Visual Code - Editor
Jenkins - CICD


Description

Backend Development is completly done using Ruby on Rails and Mysql as database.
Then created a Dockerfile for the same , built the docker image and pushed to GCR.
Deployed the docker image to Kubernetes cluster for Orchestration.
Both Ruby on Rails application and Mysql are deployed as containers in Kubernetes.
Autoscaling is applied for Ruby application ,it can scale upto to 10 pods 
Condition (Min:1 , Max: 10 , CPU Threshold: 50%)
If application reaches above 50% new pod will be created and will serve the traffic.
Used Cloud DNS and Goole Domain to Host the application on Google Cloud Platform.

Steps :

1. Built a application Using Ruby on Rails and Mysql

2. Containerised the Ruby aaplication using docker and pushed the docker image to GCR repo.

3. Created a GKE cluster in Google Cloud Platform with min 1 and max 3 nodes.

4. Deployed the application using Kubernetes.

5. Application can scale upto 10 pods(HPA min 1 max 10 cpu 50%) if the traffic increases and CPU reaches 50%.

6. Jenkins is used to Pull code from Github, Build a docker image and Deploy to Kubernetes Cluster.

7. Created Cloud DNS in Google Cloud Platform for Application and Jenkins.

URL : http://shftplan-task.worspace712.com (email: admin@gmail.com and password: admin)

Jenkins URL: http://jenkins.worspace712.com (user:admin and password: admin)

Github: https://github.com/lathi712/employeeTask 

GCR: eu.gcr.io/usertask/
