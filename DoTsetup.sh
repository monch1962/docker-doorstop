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

# Link each service to the relevant requirement/s
doorstop link SVC-AWSRDS REQ-DOTINFOSEC001
doorstop link SVC-AWSRDS REQ-DOTINFOSEC002
doorstop link SVC-AWSRDS REQ-DOTINFOSEC003
doorstop link SVC-AWSFARGATE REQ-DOTINFOSEC001
doorstop link SVC-AWSS3 REQ-DOTINFOSEC001
doorstop link SVC-AWSLAMBDA REQ-DOTINFOSEC001
doorstop link SVC-AWSAPIGATEWAY REQ-DOTINFOSEC001
doorstop link SVC-AWSRDS REQ-DOTINFOSEC001

# Create service instances & link to the relevant service
doorstop add -n ID123 INSTANCE
doorstop link INSTANCE-ID123 SVC-AWSRDS
doorstop add -n ID124 INSTANCE
doorstop link INSTANCE-ID124 SVC-AWSFARGATE
doorstop add -n ID124 INSTANCE
doorstop link INSTANCE-ID124 SVC-S3

# Add high-level design principles
doorstop add -n AWSHIGHAVAILABILITY DESIGN
doorstop add -n AWSDATASOVEREIGNTY DESIGN

DS_PATH='./items/design'
SVCNAME='AWSHIGHAVAILABILITY'
SVCDESCRIPTION=$(cat <<-END
|
  # High availability
  ## Delivered through leveraging AWS' Availability Zones (AZs)

  (some text)
  
  
  <https://aws.amazon.com/kms/>
END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/DESIGN-${SVCNAME}.yml

SVCNAME='AWSDATASOVEREIGNTY'
SVCDESCRIPTION=$(cat <<-END
|
  # Data sovereignty
  ## Delivered through leveraging AWS' Availability Zones (AZs)

  AWS customers choose the AWS Region or Regions in which their content and servers will be located. This allows customers with geographic specific requirements to establish environments in a location or locations of their choice. For example, AWS customers in Australia can choose to deploy their AWS services exclusively in one AWS Region such as the Asia Pacific (Sydney) Region and store their content onshore in Australia, if this is their preferred location. If the customer makes this choice, AWS will not move their content from Australia without the customer’s consent, except as legally required.
  
  Customers always retain control of which AWS Region(s) are used to store and process content. AWS only stores and processes each customers’ content in the AWS Region(s), and using the services, chosen by the customer, and otherwise will not move customer content without the customer’s consent, except as legally required.
  
  
  <https://d1.awsstatic.com/whitepapers/compliance/Using_AWS_in_the_context_of_Australian_Privacy_Considerations.pdf>
END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/DESIGN-${SVCNAME}.yml


# Add high-level delivery processes
doorstop add -n CODEMERGE PROCESS

DS_PATH='./items/process'
SVCNAME='CODEMERGE'
SVCDESCRIPTION=$(cat <<-END
|
  # Code merging
  ## Using a standard version control tool & process

  <https://>
END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/PROCESS-${SVCNAME}.yml
