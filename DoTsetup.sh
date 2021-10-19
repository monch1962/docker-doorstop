# Create requirements - these will fail if the service already exists
DS_PATH='./items/reqs'

REQNAME='DOTINFOSEC000'
doorstop add -n $REQNAME REQ

SVCDESCRIPTION=$(cat <<-END
|
  # DoT Information Security document
END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/REQ-${REQNAME}.yml

REQNAME='DOTINFOSEC001'
doorstop add -n $REQNAME REQ

SVCDESCRIPTION=$(cat <<-END
|
  # Information Security Risk Assessments
  
  Information security risk assessments should be completed using a consistent methodology.
  
  - Information security risk assessments and treatment plans should be developed in accordance with the Australian Standard for Risk Management AS/NZS ISO 31000:2009, the Australian Standard HB 167:2006 Security Risk Management and associated VicRoads risk management frameworks and guidelines.
  - Where the minimum information security requirements cannot be met, a risk assessment should be undertaken to define and obtain approval of exceptions. Exceptions are only permitted where the assessed residual risks are formally documented and acceptable. (Refer to section 6 Compliance.)

END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/REQ-${REQNAME}.yml

REQNAME='DOTINFOSEC002'
doorstop add -n $REQNAME REQ

SVCDESCRIPTION=$(cat <<-END
|
  # Information Security Policy, Management Framework and Planning
  
  VicRoads must ensure the information security policy is appropriately sponsored and developed in accordance with industry standards and Victorian government requirements. Information security must be appropriately managed within VicRoads and by its external parties.
  
  - VicRoads senior management must provide clear direction on information security through the development and implementation of an information security policy (this document) and a security management framework, and address information security requirements as part of the agency security plan.
  - It is the responsibility of VicRoads senior management to approve the information security policy and ensure it is published and communicated to all employees and relevant external parties.
  - VicRoads management must actively support information security through active use of this policy, clear direction, demonstrated commitment, clear assignment and acknowledgement of information security responsibilities.

END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/REQ-${REQNAME}.yml

REQNAME='DOTINFOSEC003'
doorstop add -n $REQNAME REQ

SVCDESCRIPTION=$(cat <<-END
|
  # Information Asset Management
  
  Information must be appropriately protected when stored, processed and transmitted, including appropriate destruction when no longer required, in line with the requirements for the disposal of data as specified by the Public Record Office Victoria.
  
  - VicRoads must develop and implement policies, standards and procedures for the security classification and protective handling of information (regardless of media or format) which match its value, importance and sensitivity, across all stages of the information lifecycle.
  - Critical and significant information must be identified, classified, maintained in a register, and owned by a specified Information Owner.
  - Controls and procedures for the marking, handling, sharing, transport and disposal of information must be developed and implemented. Document ID 17300061 VicRoads Information Security Policy Page 4 of 13 For Official Use Only
  - Records must be protected from loss, destruction, corruption, unauthorised access and unauthorised release, in accordance with legislative, contractual and business requirements.
  - All payment card information must be handled in accordance with the Payment Card Industry Data Security Standard (PCI DSS) and associated VicRoads’ policies, standards and procedures. 

END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/REQ-${REQNAME}.yml

REQNAME='DOTINFOSEC004'
doorstop add -n $REQNAME REQ

SVCDESCRIPTION=$(cat <<-END
|
  # Personnel Security
  
  Staff must be suitable for the roles they are engaged in and aware of VicRoads’ information security policies, in order to maximise good practice around information security, privacy and minimise inappropriate activity.
  
  - Information security roles and responsibilities of staff must be defined within relevant job descriptions as appropriate and included in conditions of employment.
  - Pre-employment screening checks must be conducted, as well as ongoing checks when staff roles change. This includes more comprehensive background checks for staff engaged to work with critical or sensitive information and/or privileged access, in accordance with HR policies.
  - Staff must be aware of and comply with VicRoads’ information security policies and standards (see Related Documents) and their security obligations, and complete information security awareness training on an annual basis.
  - VicRoads must develop and implement an Acceptable Use policy that defines acceptable and unacceptable use of VicRoads’ ICT facilities and associated staff responsibilities, including protecting passwords and sensitive information, reporting security incidents and securing portable storage devices.
  - Procedures for staff termination and change of employment must be followed to remove or change access to VicRoads’ information and information systems, and ensure VicRoads’ physical assets are repossessed 

END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/REQ-${REQNAME}.yml

REQNAME='DOTINFOSEC005'
doorstop add -n $REQNAME REQ

SVCDESCRIPTION=$(cat <<-END
|
  # External Parties Security
  
  External service providers must protect VicRoads’ information and information systems in line with this information security policy framework and the agreed obligations.
  
  - Agreements with external parties involving accessing, processing, communicating or managing VicRoads’ or other public sector information, information systems and government services must meet all relevant VicRoads’ and Victorian government information security requirements.
  - The risks to VicRoads’ information and information systems from outsourcing services to external parties must be identified, assessed and managed before granting access.
  - Contracts with external parties must outline information security responsibilities and requirements in line with the risk profile and VicRoads policy framework.
  - VicRoads must ensure the services in external party contracts, including security controls, are implemented, delivered and monitored through service reports, and audited as specified in agreements.

END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/REQ-${REQNAME}.yml

REQNAME='DOTINFOSEC006'
doorstop add -n $REQNAME REQ

SVCDESCRIPTION=$(cat <<-END
|
  # Physical and Environmental Security
  
  VicRoads’ information, information systems and staff must be protected from physical and environmental threats.
  
  - VicRoads must develop and implement physical security policies, standards and procedures to ensure that:
    - All VicRoads’ premises, server rooms, ICT equipment and devices are protected from unauthorised access, loss or theft of property or equipment and the information contained within them
    - Physical security measures for sites and buildings are integrated throughout the plan, selection, build and modification process and applied across all stages of the asset lifecycle
    - Computer facilities processing VicRoads’ information are environmentally controlled to reduce the possibility of system downtime and unauthorised access
    - Sensitive information such as reports and documents are secured through physically access controlled areas
    - Secure procedures are followed for transporting ICT equipment offsite
    - Staff are responsible for the security of portable devices in their possession including laptops, mobile phones, tablets, etc

END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/REQ-${REQNAME}.yml

REQNAME='DOTINFOSEC007'
doorstop add -n $REQNAME REQ

SVCDESCRIPTION=$(cat <<-END
|
  # Operations Management
  
  Operational management procedures must be defined and implemented to ensure the minimum security requirements of information systems are maintained. The following steps must be taken to ensure management and administration routine tasks are defined and common operational issues are minimised.
  
  - Operational procedures and measures must be documented and implemented to ensure information and information systems are securely managed.
  - Detection, prevention and recovery procedures and controls must be implemented to protect information systems against malicious code.
  - All information systems must be updated and remain within vendor support requirements.
  - Vulnerability management procedures, including security patching and penetration testing, must be developed and implemented for the ongoing detection and management of vulnerabilities in VicRoads’ systems.
  - Policies and procedures for the backup and recovery of data and software must be developed and implemented to ensure the integrity and availability of information.
  - Procedures must be defined and implemented to ensure appropriate sanitisation before disposing of information storage media and equipment.
  - Procedures must be defined and implemented to ensure that the integrity of information available on public systems is protected from unauthorised modification or loss.
  - Log management procedures must be defined and implemented, including regular reviews of logs and other controls to detect or prevent unauthorised access to VicRoads’ systems.
  - The use of BYOD facilities for access to VicRoads’ systems must be appropriately authorised and managed.

END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/REQ-${REQNAME}.yml

REQNAME='DOTINFOSEC008'
doorstop add -n $REQNAME REQ

SVCDESCRIPTION=$(cat <<-END
|
  # Access Controls
  
  Access controls must be defined and implemented to ensure access to VicRoads information and systems is effectively controlled.
  
  - VicRoads must maintain and implement identity and access management and control standards to ensure that:
    - access to critical or sensitive information and information systems is controlled and authorised by the Information Owner
    - access is based on business and security requirements (the ’need to know’ principle)
    - access is relevant to duties and there is an appropriate level of segregation of duties
    - formal user registration and de-registration processes are in place for granting and revoking access to information and systems
    - all users have a unique identifier (UserID) and access is appropriately authenticated
    - access to information and information systems is logged and regularly reviewed.

END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/REQ-${REQNAME}.yml

REQNAME='DOTINFOSEC009'
doorstop add -n $REQNAME REQ

SVCDESCRIPTION=$(cat <<-END
|
  # Systems Acquisition and Development Life Cycle (SDLC)
  
  Information systems must be implemented with an appropriate level of information security throughout their acquisition or development lifecycle, i.e. when being acquired, developed, enhanced, or provisioned internally or by an external provider.
  
  - VicRoads follows an SDLC that defines the security requirements that must be considered and reviewed throughout the information system procurement, development and maintenance lifecycle.
  - Information security controls must be implemented and tested at all stages of the development lifecycle.
  - Vendor advisories must be monitored, assessed and implemented if vulnerabilities present an unacceptable level of risk.
  - New websites and externally facing applications must be security tested before going live or after major changes.
  - Development, test and production environments for sensitive or critical systems must be segregated to reduce the risk of unauthorised access or change.
  - Data used in development and test environments must be either non-production data or suitably masked.
  - Any change to information systems must be controlled through a formal change management process.

END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/REQ-${REQNAME}.yml

REQNAME='DOTINFOSEC010'
doorstop add -n $REQNAME REQ

SVCDESCRIPTION=$(cat <<-END
|
  # Incident Management
  
  Processes and procedures must be defined and implemented to ensure security incidents are identified and effectively handled.
  
  - Security incident management responsibilities and procedures must be defined to ensure incidents are managed to minimise impact, ensure quick restoration, and retain evidence to support investigations.
  - Staff must report security breaches or incidents to VicRoads’ Service Desk.
  - Information systems must be monitored for information security events or incidents.
  - Post incident analysis must be completed for critical incidents to determine root cause and the need for improved controls.

END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/REQ-${REQNAME}.yml

REQNAME='DOTINFOSEC011'
doorstop add -n $REQNAME REQ

SVCDESCRIPTION=$(cat <<-END
|
  # Business Continuity Management (BCM)
  
  All critical or sensitive information systems must be assessed for their required level of availability to ensure minimal disruption and impact to business functions.
  
  - VicRoads must develop and implement business continuity and disaster recovery policies, standards and procedures to ensure that the business can continue to operate and that critical ICT systems and information can be recovered within acceptable timeframes in the event of a disaster.
  - Information security must be considered in the development of business continuity and disaster recovery plans to ensure an acceptable level of security is maintained during business interruption events.
  - During the information security risk assessment process, the business impact of a loss of confidentiality, integrity and availability of information and  information systems, both individual and aggregated, must be determined.

END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/REQ-${REQNAME}.yml

REQNAME='DOTINFOSEC012'
doorstop add -n $REQNAME REQ

SVCDESCRIPTION=$(cat <<-END
|
  # Independent Assurance / Audit
  
  Independent reviews or audits of VicRoads’ information security should be scheduled at planned intervals or when significant changes occur to ensure that information security is implemented and operated in accordance with policies and procedures. 
  Reviews must include assessing opportunities for improvement and the need for changes to the approach to security, including policy objectives

END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/REQ-${REQNAME}.yml


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
SVCNAME='SOLUTIONDESIGN'
doorstop add -n $SVCNAME DESIGN
SVCDESCRIPTION=$(cat <<-END
|

  <https://>
END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/DESIGN-${SVCNAME}.yml

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

DS_PATH='./items/design'
SVCNAME='AWSDATARETENTION'
doorstop add -n $SVCNAME DESIGN
SVCDESCRIPTION=$(cat <<-END
|
  # Data retention
  
  Delivered through the following process

  - data stored in RDS will be backed up via RDS' snapshot facility
  - these RDS snapshots will be converted to flat files
  - the flat files will then be encrypted using AWS CMEKs
  - the encrypted flat files will be moved to AWS S3 Glacier for long term data storage
  
  
  <https://aws.amazon.com/rds/>
  <https://aws.amazon.com/s3/glacier/>
  <https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html>
  <https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html>
END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/DESIGN-${SVCNAME}.yml

# Add high-level delivery processes
doorstop add -n CODEMERGE PROCESS
doorstop add -n SOURCECONTROL PROCESS

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

DS_PATH='./items/process'
SVCNAME='SOURCECONTROL'
doorstop add -n $SVCNAME PROCESS
SVCDESCRIPTION=$(cat <<-END
|
  # Source control
  
  Source code will be managed using git

  Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

  Git is easy to learn and has a tiny footprint with lightning fast performance. It outclasses SCM tools like Subversion, CVS, Perforce, and ClearCase with features like cheap local branching, convenient staging areas, and multiple workflows.

  <https://git-scm.com/>
END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/PROCESS-${SVCNAME}.yml

DS_PATH='./items/process'
SVCNAME='DELIVERYPROCESSES'
doorstop add -n $SVCNAME PROCESS
SVCDESCRIPTION=$(cat <<-END
|
  
END
) \
yq eval -i '.text = env(SVCDESCRIPTION)' ${DS_PATH}/PROCESS-${SVCNAME}.yml
