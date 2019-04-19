# terraform_azure_storage_account
Terraform configuration that creates Azure Storage Account



**TO-DO**
- Prepare thorough README

**DONE**

- Add terraform config that creates Azure Storage Account
- Add terraform random provider to the code, so the Azure Storage Account name could be unique every time

**Prerequisites**

- [Azure Account](https://docs.microsoft.com/en-us/learn/modules/create-an-azure-account/)
- Azure-CLI installed. You could get it [here](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest)
- Terraform-CLI locally installed. You could get it [here](https://www.terraform.io/downloads.html) 

**Setup Terraform access to Azure**
- The explainations below are based on this article: [Link](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure)
- Sign in with Azure CLI
   - one way is to run ```az login``` which will redirect you to Azure's login page
   - other way is to provide parameters to the `-u` and `-p` argumets:
       - ```az login -u <your_username> -p <your_password>```
- Create
 Setup Terraform access ot azure
