# Terraform Azure Web Server
>This code is provided as is for educational purposes only, and is not intended for use in production environments.

This project deploys a web server on Azure using Terraform. 

>**IMPORTANT**: This Terraform code will create Azure resources that may incur charges on your subscription. Please make sure to review the code and understand the costs before proceeding with deployment.

>**NOTE**: This project includes default values for the `image_publisher`, `image_offer`, and `image_sku` variables in the `variables.tf` file. These defaults are intended to make it easy for you to test and learn about this Terraform project. However, if you would like to use a different Azure image, you can modify these values in one of two ways:
>1. You can modify the default values directly in the root `variables.tf` file.
>2. Alternatively, you can override the default values by defining new values for `image_publisher`, `image_offer`, and `image_sku` in the file named `terraform.tfvars`.


## Modules

### Virtual Network

This module creates a virtual network on Azure.

#### Inputs

- `virtual_network_name`: The name of the virtual network.
- `resource_group_name`: The name of the resource group.
- `location`: The location of the resource group.
- `virtual_network_address_space`: The address space for the virtual network.
- `subnet_name`: The name of the subnet.
- `subnet_address_prefixes`: The address prefix for the subnet.
- `public_ip_name`: The name of the public IP address.

#### Outputs

- `subnet_id`: The ID of the subnet.
- `public_ip_id`: The ID of the public IP address.

### Network Interface

This module creates a network interface on Azure.

#### Inputs

- `vmname`: The name of the virtual machine.
- `location`: The location of the resource group.
- `resource_group_name`: The name of the resource group.
- `subnet_id`: The ID of the subnet.
- `private_ip_address`: The private IP address for the network interface.
- `public_ip_address_id`: The ID of the public IP address.

#### Outputs

- `nic_id`: The ID of the network interface.

### Virtual Machine

This module creates a virtual machine on Azure.

#### Inputs

- `vmname`: The name of the virtual machine.
- `location`: The location of the resource group.
- `resource_group_name`: The name of the resource group.
- `network_interface_ids`: The ID of the network interface.
- `vm_size`: The size of the virtual machine.
- `os_disk_type`: The type of the OS disk.
- `admin_usename`: The admin username for the virtual machine.
- `admin_password`: The admin password for the virtual machine.
- `image_publisher`: The publisher of the image.
- `image_offer`: The offer of the image.
- `image_sku`: The SKU of the image.

#### Outputs

- `vm_id`: The ID of the virtual machine.
- `public_ip`: The public IP address of the virtual machine.

### Network Security Group

This module creates a network security group on Azure.

#### Inputs

- `sgname`: The name of the security group.
- `location`: The location of the resource group.
- `resource_group_name`: The name of the resource group.

#### Outputs

- `sg_id`: The ID of the security group.

### Network Security Association

This module associates a network interface with a network security group on Azure.

#### Inputs

- `network_interface_ids`: The ID of the network interface.
- `network_security_group_id`: The ID of the network security group.

### Install IIS

This Terraform module provisions an Azure Custom Script Extension that installs Internet Information Services (IIS) and configures it to use a custom start page and run a CPU/RAM logger script. The custom data is read from the `./data/data.txt` file and the script is written to the `C:\scripts` folder in the virtual machine. The start page is overwritten with the custom data from the `data.txt` file. 

#### Inputs

- `virtual_machine_id`: The ID of the virtual machine.

## terraform.tfvars

`terraform.tfvars` contains the input variables needed for the Terraform configuration to run. Ensure that all variables are set with appropriate values in this file before running the Terraform configuration.

## Usage

To use this project, follow these steps:

1. Install Terraform.
2. Clone this repository.
3. Navigate to the repository directory.
4. Run `terraform init`.
5. Run `terraform validate` to see if the code is valid.
6. Run `terraform plan -out "./data/plan.txt"`
7. Run `terraform apply "./data/plan.txt"`

## License

This project is licensed under the MIT License.