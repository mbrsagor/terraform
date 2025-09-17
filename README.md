# Terraform

> Terraform is an **infrastructure-as-code** (IaC) software tool developed by HashiCorp. It allows you to define, provision, and manage cloud infrastructure using a declarative configuration language known as **HashiCorp Configuration Language (HCL)**. Alternatively, JSON can also be used for the configuration.


### Setting Up AWS CLI on Your Local Development Machine

> Before using Terraform to manage AWS infrastructure, you need to configure the AWS Command Line Interface (CLI) on your local machine. Follow the steps below:

#### 1. Install AWS CLI:
If you haven't already, install the AWS CLI for your operating system. You can find installation instructions for different platforms [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).


### Configure AWS CLI:
> Once installed, open your terminal and run the following command to configure your AWS CLI:

```bash
 aws configure
```
After that ask you input some information like this:
```bash
AWS Access Key ID [None]: your access key here
AWS Secret Access Key [None]: your secret key here
Default region name [None]: us-east-1
Default output format [None]:
```

> Here `region` what ever you want. And then `output` format you can `none` value. No issue will be happen. 

### Deleting AWS CLI Configuration
```bash
rm -rf ~/.aws
```


#### Terraform basic concept:
- terraform init
- terraform plan
- terraform apply
- terraform destroy
