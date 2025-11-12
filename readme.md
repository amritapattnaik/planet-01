rtc-terraform

GitHub Actions workflow:
 	Workflow Name: 	rtc-workflow.yml
 	Trigger Type:	workflow_dispatch [Includes a choice parameter (Dev or Test) to select the target environment when manually triggered. 
				Future environments such as Stage and Prod can be added later as needed.
 

 Trigger Condition:
   	1. On Push to the feature branch "rtc-tf-dev" #branch given here for referance
    	2. On PR merge to the feature branch "rtc-tf-dev" to "main" #branch given here for referance


 Secret Management: 
	Service account key is configured at the GitHub repository level with the key name:
	RTC_GCP_TERRAFORM_SAKEY_DEV for Dev environments respectively.

 Terraform Calling modules:
    	1. terraform.tfvars - Defines input values for modules and enables flags (True for resource creation, False for resource destruction).
    	2. variables.tf 	- Declares variables for each module.
    	3. callingmodule.tf - Invokes resource modules for deployment.


Terraform modules for infrastructure in Dev/Test pipeline:

	modules → cloud-route-nat
	modules → gcs-bucket
	modules → gke_cluster
	modules → namespace
	modules → psa
	modules → registry
	modules → subnet
	modules → vpc


Process to provision the infrastructure:
  Commands used in the pipeline: 
    terraform init
    terraform validate
    terraform refresh -lock=false
    terraform fmt
    terraform plan -lock=false
    terraform apply -auto-approve
    terraform state list

Operation steps to deploy in new higher environment:
	1. Create a new backend configuration file tailored for the target environment, ensuring all necessary settings are included.
		Example: backend-dev.tfvars is used for the development environment.
		Similarly, create a new configuration file named backend-<target>.tfvars for the required target environment by duplicating the development file and 			updating the parameters accordingly.

	2. Duplicate an existing configuration file from a lower environment, then update the relevant parameters to match the requirements of the new environment.
		Example: configuration-dev.tfvars is used for the development environment.
		Similarly, create a new configuration file named configuration-<target>.tfvars for the required target environment by duplicating the development file and 		updating the parameters accordingly.

	3. Submit a pull request (PR) with the above changes and merge it into the main branch after review.

	4. Once the pull request is approved and the code is merged into the main branch, manually trigger the pipeline with the appropriate target branch to begin the 	   deployment.

Resource Deletion Order (Important)
	To avoid dependency errors (e.g., terraform refresh -- unauthorized):

	Delete namespace first
	Then delete:
		- gke_cluster
		- cloud-route-nat
		- registry
		- subnet
		- vpc
