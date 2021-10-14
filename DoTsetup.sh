doorstop create -d 5 -s - REQ ./items/reqs

# Add new fields for requirement category & requirement source
yq eval -i 'with(.attributes.defaults; .categories = ["functional", "usability", "reliability", "performance", "security", "constraint"], .requirement-source = "" lineComment="Source for the requirement", .requirement-url = "")' ./items/reqs/.doorstop.yml
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
END
) \
yq eval -i '.text = env(AWSS3DESCRIPTION)' ./items/svc/SVC-AWSS3.yml

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