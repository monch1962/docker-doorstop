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