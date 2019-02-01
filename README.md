Technologies Used

Ruby on Rails - Backend Development
Mysql - Database
Docker - Containerization
Kubernetes - Orchestration Tool
Google Cloud - Google Kubernetes Engine(GKE), Cloud DNS , Google Container Registry(GCR)
Visual Code - Editor


Description

Backend Development is completly done using Ruby on Rails and Mysql as database.
Then created a Dockerfile for the same , built the docker image and pushed to GCR.
Deployed the docker image to Kubernetes cluster for Orchestration.
Both Ruby on Rails application and Mysql are deployed as containers in Kubernetes.
Autoscaling is applied for Ruby application ,it can scale upto to 10 pods 
Condition (Min:1 , Max: 10 , CPU Threshold: 50%)
If application reaches above 50% new pod will be created and will serve the traffic.
Used Cloud DNS and Goole Domain to Host the application on Google Cloud Platform.

URL : http://shftplan-task.worspace712.com
Github: https://github.com/lathi712/employeeTask
GCR: eu.gcr.io/usertask/ruby
