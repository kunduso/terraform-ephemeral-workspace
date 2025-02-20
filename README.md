# Learn HCP Terraform Ephemeral Workspace
![Image](https://skdevops.files.wordpress.com/2025/02/111-image-0.png)
## Introduction
This repository demonstrates how to work with ephemeral workspaces in HashiCorp Cloud Platform (HCP) Terraform. It provides an example Terraform configuration for leveraging ephemeral workspaces in your Terraform workflows.

Ephemeral refers to something that does not last for a long time. In HCP Terraform, a workspace is a group of infrastructure resources managed by Terraform. Hence, an ephemeral workspace does not last for a long time. This implies that it is suitable for IaC use cases where the resources are provisioned for a short duration, primarily for a proof of concept or to verify a specific functionality.
## Prerequisites
Before you begin, ensure you have the following:
- An active [AWS account](https://console.aws.amazon.com/console/home#)
- An active [HCP Terraform account](https://app.terraform.io/session) with HCP Terraform Plus or Terraform Enterprise (GA) organizations plan. (Please navigate to the Organization Settings → Plan & Billings to verify the current plan.)
- Basic knowledge of AWS and Terraform

## Getting Started
1. Please learn about [HCP Terraform](https://developer.hashicorp.com/terraform/cloud-docs)
2. Clone this repository
3. Please study the steps listed in the note - [Provision AWS resources with GitHub and HCP Terraform](http://skundunotes.com/2025/01/03/provision-aws-resources-with-github-and-hcp-terraform/)
4. Follow the detailed steps in the note - [Getting started with Ephemeral workspaces in HCP Terraform](https://skundunotes.com/2025/02/20/getting-started-with-ephemeral-workspaces-in-hcp-terraform/).

## Troubleshooting
If you encounter issues:
1. Ensure your AWS credentials (`access_key` and `secret_key`) are correct and have the necessary permissions
2. Check that your HCP Terraform organization plan is either Plus or Enterprise.

For more help, consult the [HCP Terraform documentation](https://developer.hashicorp.com/terraform/cloud-docs).

## Contributing
If you find any issues or have suggestions for improvement, feel free to open an issue or submit a pull request. Contributions are always welcome!
## License
This code is released under the Unlicense License. See [LICENSE](LICENSE).