doorstop create -d 5 -s - REQ ./items/reqs

# Add new fields for requirement category & requirement source
yq eval -i 'with(.attributes.defaults; .categories = ["functional", "usability", "reliability", "performance", "security", "design-constraint", "implementation-constraint", "interface-constraint", "physical-constraint"], .requirement-source = "" lineComment="Source for the requirement", .requirement-url = "")' ./items/reqs/.doorstop.yml
yq eval -i '.attributes.defaults.categories lineComment="Remove the categories that do not apply to this requirement"' ./items/reqs/.doorstop.yml
yq eval -i '.attributes.defaults.requirement-source lineComment="Describe the source for this requirement (e.g. client, regulator, Deloitte best practice)"' ./items/reqs/.doorstop.yml
yq eval -i '.attributes.defaults.requirement-url lineComment="Provide a link to the source document for this requirement"' ./items/reqs/.doorstop.yml


doorstop create -d 5 -s - SVC ./items/svc --parent REQ
# Add new array fields to contain svc-requirement-links & service-level Terraforms
yq eval -i 'with(.attributes.defaults; .svc-requirement-links = [], .service-level-terraforms = [])' ./items/svc/.doorstop.yml
yq eval -i '.attributes.defaults.svc-requirement-links lineComment="Link to any cloud service vendor docs that describe how requirements are met"' ./items/svc/.doorstop.yml
yq eval -i '.attributes.defaults.service-level-terraforms lineComment="Link to any Terraforms used to stand up this service"' ./items/svc/.doorstop.yml
#yq eval '.attributes.defaults.svc-requirement-links[] += (.provider-info-urls = [], .requirement-id = "ABC123", .description = "Put some text here")' ./items/svc/.doorstop.yml

doorstop create -d 5 -s - INSTANCE ./items/instances --parent SVC
# Add new fields to contain Jira URLs, instance-specific Terraform URLs and test case URLs
yq eval -i 'with(.attributes.defaults; .jira-urls = [], .instance-specific-terraform-urls = [], .test-case-urls = [], .cloud-formation-urls = [])' ./items/instances/.doorstop.yml
yq eval -i '.attributes.defaults.test-case-urls lineComment="Link to any test-case URLs that confirm requirements are being met for this service"' ./items/instances/.doorstop.yml
yq eval -i '.attributes.defaults.instance-specific-terraform-urls lineComment="Provide a URL to all Terraforms used for deploying this particular instance"' ./items/instances/.doorstop.yml
yq eval -i '.attributes.defaults.jira-urls lineComment="Link to any Jira URLs that relate to validating requirements for this service"' ./items/instances/.doorstop.yml
yq eval -i '.attributes.defaults.cloud-formation-urls lineComment="Provide a URL to all CloudFormations used for deploying this particular instance"' ./items/instances/.doorstop.yml

# Create requirements - these will fail if the service already exists
doorstop add -n DOTINFOSEC001 REQ
doorstop add -n DOTINFOSEC002 REQ
doorstop add -n DOTINFOSEC003 REQ
doorstop add -n DOTINFOSEC004 REQ
doorstop add -n DOTINFOSEC005 REQ
doorstop add -n DOTINFOSEC006 REQ
doorstop add -n DOTINFOSEC007 REQ
doorstop add -n DOTINFOSEC008 REQ
doorstop add -n DOTINFOSEC009 REQ
doorstop add -n DOTINFOSEC010 REQ
doorstop add -n DOTINFOSEC011 REQ
doorstop add -n DOTINFOSEC012 REQ

# Create services - these will fail if the service already exists
doorstop add -n AWSRDS SVC
doorstop add -n AWSFARGATE SVC
doorstop add -n AWSS3 SVC
doorstop add -n AWSEKS SVC
doorstop add -n AWSALB SVC
doorstop add -n AWSNLB SVC
doorstop add -n AWSLAMBDA SVC
doorstop add -n AWSAPIGATEWAY SVC
doorstop add -n AWSAVAILABILITYZONE SVC
doorstop add -n AWSREGION SVC
doorstop add -n AWSNEPTUNE SVC
doorstop add -n AWSCOGNITO SVC

# Populate descriptions
AWSS3DESCRIPTION=$(cat <<-END
|
  # Amazon S3
  ## Object storage built to store and retrieve any amount of data from anywhere
  
  Amazon Simple Storage Service (Amazon S3) is an object storage service that offers industry-leading scalability, data availability, security, and performance. This means customers of all sizes and industries can use it to store and protect any amount of data for a range of use cases, such as data lakes, websites, mobile applications, backup and restore, archive, enterprise applications, IoT devices, and big data analytics. Amazon S3 provides easy-to-use management features so you can organize your data and configure finely-tuned access controls to meet your specific business, organizational, and compliance requirements. Amazon S3 is designed for 99.999999999% (11 9's) of durability, and stores data for millions of applications for companies all around the world.
  
  <https://aws.amazon.com/s3/>
END
) \
yq eval -i '.text = env(AWSS3DESCRIPTION)' ./items/svc/SVC-AWSS3.yml

AWSRDSDESCRIPTION=$(cat <<-END
|
  # Amazon Relational Database Service (RDS)
  ## Set up, operate, and scale a relational database in the cloud with just a few clicks.
  
  Amazon Relational Database Service (Amazon RDS) makes it easy to set up, operate, and scale a relational database in the cloud. It provides cost-efficient and resizable capacity while automating time-consuming administration tasks such as hardware provisioning, database setup, patching and backups. It frees you to focus on your applications so you can give them the fast performance, high availability, security and compatibility they need.
  
  <https://aws.amazon.com/rds/>
END
) \
yq eval -i '.text = env(AWSRDSDESCRIPTION)' ./items/svc/SVC-AWSRDS.yml

AWSFARGATEDESCRIPTION=$(cat <<-END
|
  # AWS Fargate
  ## Serverless compute for containers
  
  Deploy and manage your applications, not infrastructure. Fargate removes the operational overhead of scaling, patching, securing, and managing servers.
  
  Monitor your applications via built-in integrations with AWS services like Amazon CloudWatch Container Insights. Gather metrics and logs with third-party tools.
  
  Improve security through workload isolation by design. Amazon ECS tasks and Amazon EKS pods run in their own dedicated runtime environment.
  
  Only pay for what you use. Fargate scales the compute to closely match your specified resource requirements. With Fargate, there is no over-provisioning and paying for additional servers.
  
  <https://aws.amazon.com/fargate/>
END
) \
yq eval -i '.text = env(AWSFARGATEDESCRIPTION)' ./items/svc/SVC-AWSFARGATE.yml

DESCRIPTION=$(cat <<-END
|
  # Amazon Elastic Kubernetes Service (EKS)
  ## The most trusted way to start, run, and scale Kubernetes
  
  Explore multiple ways to configure VPC, ALB, EC2 Kubernetes worker nodes, and Amazon EKS.
  Reduce costs with efficient compute resource provisioning and automatic Kubernetes application scaling.
  Ensure a more secure Kubernetes environment with security patches automatically applied to your cluster’s control plane.
  
  <https://aws.amazon.com/eks/>
END
) \
yq eval -i '.text = env(DESCRIPTION)' ./items/svc/SVC-AWSEKS.yml

DESCRIPTION=$(cat <<-END
|
  # Elastic Load Balancing
  ## Distribute network traffic to improve application scalability
  
  Secure your applications with integrated certificate management, user-authentication, and SSL/TLS decryption.
  Deliver applications with high availability and automatic scaling.
  Monitor the health and performance of your applications in real time, uncover bottlenecks, and maintain SLA compliance.
  
  <https://aws.amazon.com/elasticloadbalancing/>
END
) \
yq eval -i '.text = env(DESCRIPTION)' ./items/svc/SVC-AWSALB.yml

DESCRIPTION=$(cat <<-END
|
  # AWS Lambda
  ## Run code without thinking about servers or clusters
  
  Run code without provisioning or managing infrastructure. Simply write and upload code as a .zip file or container image.
  Automatically respond to code execution requests at any scale, from a dozen events per day to hundreds of thousands per second.
  Save costs by paying only for the compute time you use—by per-millisecond—instead of provisioning infrastructure upfront for peak capacity.
  Optimize code execution time and performance with the right function memory size. Respond to high demand in double-digit milliseconds with Provisioned Concurrency.
  
  <https://aws.amazon.com/lambda/>
END
) \
yq eval -i '.text = env(DESCRIPTION)' ./items/svc/SVC-AWSLAMBDA.yml

DESCRIPTION=$(cat <<-END
|
  # Amazon API Gateway
  ## Create, maintain, and secure APIs at any scale
  
  Amazon API Gateway is a fully managed service that makes it easy for developers to create, publish, maintain, monitor, and secure APIs at any scale. APIs act as the "front door" for applications to access data, business logic, or functionality from your backend services. Using API Gateway, you can create RESTful APIs and WebSocket APIs that enable real-time two-way communication applications. API Gateway supports containerized and serverless workloads, as well as web applications.

  API Gateway handles all the tasks involved in accepting and processing up to hundreds of thousands of concurrent API calls, including traffic management, CORS support, authorization and access control, throttling, monitoring, and API version management. API Gateway has no minimum fees or startup costs. You pay for the API calls you receive and the amount of data transferred out and, with the API Gateway tiered pricing model, you can reduce your cost as your API usage scales.
  
  <https://aws.amazon.com/api-gateway/>
END
) \
yq eval -i '.text = env(DESCRIPTION)' ./items/svc/SVC-AWSAPIGATEWAY.yml

DESCRIPTION=$(cat <<-END
|
  # Amazon Neptune
  ## Build and run graph applications with highly connected datasets
  
  Build and run identity, knowledge, fraud graph, and other applications with performance, and execute more than 100,000 queries per second.
  Deploy high performance graph applications using popular open-source APIs such as Gremlin, openCypher and SPARQL, and easily migrate existing applications.
  Operate graph databases without worrying about hardware provisioning, software patching, setup, configuration, or backups; and pay no upfront licensing costs.
  
  <https://aws.amazon.com/neptune/>
END
) \
yq eval -i '.text = env(DESCRIPTION)' ./items/svc/SVC-AWSNEPTUNE.yml

DESCRIPTION=$(cat <<-END
|
  # Amazon Cognito
  ## Simple and Secure User Sign-Up, Sign-In, and Access Control
  
  Amazon Cognito lets you add user sign-up, sign-in, and access control to your web and mobile apps quickly and easily. Amazon Cognito scales to millions of users and supports sign-in with social identity providers, such as Apple, Facebook, Google, and Amazon, and enterprise identity providers via SAML 2.0 and OpenID Connect.  
  
  <https://aws.amazon.com/cognito/>
END
) \
yq eval -i '.text = env(DESCRIPTION)' ./items/svc/SVC-AWSCOGNITO.yml
# Link each service to the relevant requirement/s
doorstop link SVC-AWSRDS REQ-IAM001
doorstop link SVC-AWSFARGATE REQ-IAM001
doorstop link SVC-AWSS3 REQ-IAM001
doorstop link SVC-AWSLAMBDA REQ-IAM001
doorstop link SVC-AWSAPIGATEWAY REQ-IAM001
doorstop link SVC-AWSRDS REQ-CBA001

# Create service instances & link to the relevant service
doorstop add -n ID123 INSTANCE
doorstop link INSTANCE-ID123 SVC-AWSRDS
doorstop add -n ID124 INSTANCE
doorstop link INSTANCE-ID124 SVC-AWSFARGATE