<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Kubernetes Deployment of Two-Tier Application</title>
</head>
<body>
  <h1>Kubernetes Deployment of Two-Tier Application</h1>
  
  <h2>Overview</h2>
  <p>This project focuses on deploying a two-tier application consisting of a Frontend (Python) and Backend (Redis) microservices on Kubernetes. The deployment is orchestrated using Docker for containerization and Kubernetes for management.</p>

  <h2>Technologies Used</h2>
  <ul>
    <li>Docker: Containerization of application components with images stored on Dockerhub registry.</li>
    <li>Terraform: Infrastructure provisioning on AWS, including secure storage of backend configuration files in an AWS S3 bucket, configured with a DynamoDB table to ensure exclusive access.</li>
    <li>Kubernetes: Deployment of application components, with the implementation of Horizontal Pod Autoscaler (HPA) to automatically scale the backend (Redis) based on CPU utilization.</li>
  </ul>

  <h2>Key Features</h2>
  <ul>
    <li><strong>Containerization:</strong> Utilizing Docker to encapsulate application components, ensuring consistency and portability across environments.</li>
    <li><strong>Infrastructure as Code (IaC):</strong> Leveraging Terraform to automate the provisioning of AWS resources, promoting reproducibility and scalability.</li>
    <li><strong>Secure Configuration Management:</strong> Storing sensitive backend configuration files securely in an AWS S3 bucket, with access controlled via DynamoDB table to prevent concurrent modifications.</li>
    <li><strong>Scalability:</strong> Implementing Horizontal Pod Autoscaler (HPA) in Kubernetes to dynamically scale the backend microservice based on CPU usage, ensuring optimal resource utilization.</li>
  </ul>

  <h2>Accessing the Application</h2>
  <p>The application can be accessed through the browser via the vote service, which is exposed through a load balancer.</p>
</body>
</html>

