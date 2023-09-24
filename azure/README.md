# Azure_Terraform_Demos

A set of demos (hopefully) to provide a basic overview of how to deploy infrastructure as code in Azure using Terraform.

Prerequisites:

- Microsoft Azure account with subscription set up.

- Azure CLI installed - <https://docs.microsoft.com/en-us/cli/azure/install-azure-cli>

- Terraform installed and added to system path - <https://learn.hashicorp.com/tutorials/terraform/install-cli>

# Steps

- Log in to Azure using the Azure CLI via:

  - `az login`

- In the folder of choice, ensure regions match where appropriate and tweak the resources and versions to suit.

- Configure az account to set subscription you want to deploy resources to: `az account set --subscription "<Subscription_Name>"`

- Ensure you have created a service principal for authentication via Terraform, output should be similar to the following:

```powershell
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"

Creating 'Contributor' role assignment under scope '/subscriptions/35akss-subscription-id'
The output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. For more information, see https://aka.ms/azadsp-cli
{
  "appId": "xxxxxx-xxx-xxxx-xxxx-xxxxxxxxxx",
  "displayName": "azure-cli-2022-xxxx",
  "password": "xxxxxx~xxxxxx~xxxxx",
  "tenant": "xxxxx-xxxx-xxxxx-xxxx-xxxxx"
}  
```

- Set environment variables based on the output from the service principal command (if on Linux, swap `$Env:` with `export`):
  - `$Env:ARM_CLIENT_ID = "<APPID_VALUE>"`
  - `$Env:ARM_CLIENT_SECRET = "<PASSWORD_VALUE>"`
  - `$Env:ARM_SUBSCRIPTION_ID = "<SUBSCRIPTION_ID>"`
  - `$Env:ARM_TENANT_ID = "<TENANT_VALUE>"`

- Initialize the directory: `terraform init`

- As good practice, validate the configuration files to ensure there are no syntactical errors, etc: `terraform validate`

- Note - This won't be necessary for this repo, but it's good practice nonetheless to ensure readability of your config   files: `terraform fmt`

- View the plan for your infrastructure deployment and verify it matches expectations: `terraform plan`

- Apply after any issues with the plan are resolved: `terraform apply` (type `yes` to approve, if you're confident and **NOT IN A PRODUCTION ENVIRONMENT** add the flag `--auto-approve` after apply)

- Once the CLI indicates the resources are created, access Azure to view and use the applications where appropriate.

## Visualising Dependencies

A growth in complexity is inevitable with application(s) and organisational growth.
To help understand this, Terraform has a nifty functionality to help visualise infrastructure dependencies, the graph command.
By doing so, Terraform will analyse the desired state (the infrastructure specified in your .tf configuration files) and export the analysed resources and their dependencies into a dot file. This can be done by using:

```shell
terraform graph > filename.dot
```

This dot file can then be reformatted into a more displayable form, alternatively, using a tool such as Graphviz, available at <https://graphviz.org/download/>. You can skip this step and use terraform graph to output to a format such as svg. Make sure plugins are enabled by running the following command with admin privileges:

```shell
dot -c
```

Next, you can run Terraform graph and pipe the output to the format of your choice (Assuming it's supported by Graphviz), for example:

```shell
terraform graph | dot -Tsvg > graph.svg
```

Make sure to specify the image format immediately after the -T flag.
