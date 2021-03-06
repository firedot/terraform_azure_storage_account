# terraform_azure_storage_account
Terraform configuration that creates Azure Storage Account



**TO-DO**
- Add outputs for:
   - test_resource_group's name
   - asa_test's name
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
- After you are signed in, run the following commands:
   - To get your SubscriptionID and your TenantID:
     ```az account show --query "{subscriptionId:id, tenantId:tenantId}"```
   - To use a selected subscription for this session, run the following command:
     ```az account set --subscription="<your_subscription_id>"```
- Now you can create Azure AD Service principal (if you don't already have on):
   - To create your Azure AD Service principal, run the following command:
   ```
     az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<your_subscription_id>"
   ```
   - After running the previous line, the following will be returned:
   ```
      appId
      password
      sp_name
      tenant
   ```
     - Make note of ```appId```

- Configure Terraform environment variables:
   ```
   export ARM_SUBSCRIPTIONID=<your_subscription_id>
   export ARM_CLIENT_ID=<your_appId>
   export ARM_CLIENT_SECRET=<your_password>
   export ARM_TENANT_ID=<your_tenant_id>
   ```
**What the terraform configuration in the repo is goint to do**

- The terraform configuration in this repository will:
   - Create a random_string resource called ```my_random_string``` 
     consisted of **ONLY** lowercase letters and numbers, with length of 10 characters
   - Create an azurerm_resource_group called ```test_resource_group```
      - for name of the group will be used a result generated by the random_string resource
   - Create an azurerm_storage_account called ```asa_test```
      - for name of the storage account will be used a result genarated by the random_string resource
- Written this way, the configuration complies with Azure's requirement for Azur Storage Acount, which is:
   - Azure wide unique ASA name
   - The name should be comprised of lowercase letters and numbers only
   - The name should be between 3 and 24 characters long
- More information regarding Azure Storage Account creation may be found [here](https://docs.microsoft.com/en-us/azure/storage/common/storage-quickstart-create-account?tabs=azure-portal#create-a-storage-account-1)

**How to use this repo**

- Clone this repository:
```
git clone https://github.com/firedot/terraform_azure_storage_account.git
```

- Go to the cloned repository directory
```
cd terraform_azure_storage_account
```

- Run terraform plan
```
terraform plan
```

- If you are satisfied with the output, apply the configuration:
```
terraform apply
```
