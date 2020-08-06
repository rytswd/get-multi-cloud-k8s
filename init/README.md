# Steps for Initial Setup

In order to wire up everything nicely, there is some manual orchestration effort required at first.

## Overview

The initialization steps are to set up the followings:

- Terraform State Backend: Terraform Cloud
- Terraform Plan: GitHub Actions
- Terraform Apply: GitHub Actions

You can find the rationale for these selections at Setup Rationale below.

The below is the steps needed

1. Create a Terraform workspace in Terraform Cloud
1. Set up your own login credentials for cloud services
1. Create login credential for Terraform to use
1. Add credentials to GitHub secrets
1. Reconfigure Terraform to use new credentials
1. Remove your own login credentials

---

### Step 0. Create your cloud service account

You need to create account for cloud services you want to use.

It should be straighforward to find the getting started document for any providers.

This repository setup assumes the following accounts:

- GitHub
- AWS
- GCP
- Terraform Cloud

### Step 1. Create a Terraform workspace in Terraform Cloud

## Step 1. Set up your own login credentials for cloud services

In order to run any automation, you have to first have the account.

### AWS

From Console, go to `My Security Credentials`, and select `Access keys` to create a temporary key.

### GCP

```bash
$ gcloud config configurations create rytswd
```

```bash
$ gcloud auth login
```

```bash
$ gcloud auth application-default login
```

### Step 4. GitHub Secrets

- `AWS_ACCESS_KEY_ID`: AWS Access Key ID
- `AWS_SECRET_ACCESS_KEY`: AWS Secret Access Key
- `TERRAFORM_CLOUD_INIT_API_TOKEN`: API Token for Terraform Cloud, specifically for `init` folder

## Setup Rationale

To be added
