# Overview

The initialization steps are to set up the followings:

- Terraform State Backend: Terraform Cloud
- Terraform Plan: GitHub Actions
- Terraform Apply: GitHub Actions

You can find the rationale for these selections at Setup Rationale below.

# Steps for Initial Setup

In order to wire up everything nicely, there is some manual orchestration effort required at first.

The below is the steps needed

1. Create a Terraform workspace in Terraform Cloud
1. Set up your own login credentials for cloud services
1. Add credentials to GitHub secrets
1. Reconfigure Terraform to use new credentials
1. Remove your own login credentials

---

## Step 0. Create your cloud service account

You need to create account for cloud services you want to use.

It should be straighforward to find the getting started document for any providers.

This repository setup assumes the following accounts:

- GitHub
- AWS
- GCP
- Terraform Cloud

## Step 1. Create a Terraform workspace in Terraform Cloud

_To be added_

## Step 2. + Step 3. for AWS

<details>
<summary>Expand for detailed steps</summary>

## Step 2. Set up your own login credentials for cloud services

In order to run any automation, you have to use your account first.

From Console, go to `My Security Credentials`, and select `Access keys` to create a temporary key.

You will get `Access Key ID` and `Secret Access Key`.

## Step 3. Add credentials to GitHub secrets

These need to be used by Terraform, so go to GitHub repo, and add these as Secret.

Secrets need to be added with the following names:

- `AWS_ACCESS_KEY_ID`  
  This should be set to something like `AKIAJEGQB4X5S4P7ZVFQ`
- `AWS_SECRET_ACCESS_KEY`  
  This should be set to the generated key like `w0vhCasBSmUl8roC/zZKa/ti/CE3Eu+MHqM+vOga`

**_NOTE_**: _These should be replaced with another key. It will be discussed at Step 5._

</details>

## Step 2. + Step 3. for GCP

<details>
<summary>Expand for detailed steps</summary>

## Step 2. Set up your own login credentials for cloud services

Before managing all the resources with Terraform, you need to set up GCP for Terraform usage.

Here is the list of `gcloud` CLI commands to run.

```bash
# Create gcloud configuration for your machine environment.
# With this, you won't have conflicting account setup even if you have multiple
# GCP account.
#
# I'm naming this configuration as `rytswd`, but you can name however you want.
# This is truly on your machine only.
$ gcloud config configurations create rytswd
```

```bash
# Log into Google, and wire up the above `rytswd` configuration with the login.
$ gcloud auth login
```

```bash
# With your account login above, create a new project.
#
# Here, I'm calling it `rytswd-get-multi-cloud-k8s-v01`. This needs to be
# universally unique.
$ gcloud projects create rytswd-get-multi-cloud-k8s-v01
```

```bash
# Create another gcloud configuration for your machine environment.
#
# This is different from the first command, because I will be adding project
# reference, region, etc. into this configuration. You can reuse the earlier
# configuration instead, but this makes it absolutely clear that permission
# is managed separately.
$ gcloud config configurations create rytswd-get-multi-cloud-k8s
```

```bash
# Set zone to your configuration.
$ gcloud config set compute/zone europe-west2-a
```

```bash
# Set the project you created earlier to your configuration.
$ gcloud config set project rytswd-get-multi-cloud-k8s-v01
```

```bash
# Create a dedicated Service Account for Terraform.
#
# I'm calling it "terraform-admin".
$ gcloud iam service-accounts create terraform-admin \
    --description="Terraform Admin Account for Terraform integration" \
    --display-name="Terraform Admin"
```

```bash
# Ensure the Service Account has the appropriate entitlements to manage the
# resources.
#
# You should be tuning the entitlement levels according to your needs. Here,
# I'm taking a shortcut and assigning `roles/owner`.
$ gcloud iam service-accounts add-iam-policy-binding \
    terraform-admin@rytswd-get-multi-cloud-k8s-v01.iam.gserviceaccount.com \
    --member serviceAccount:terraform-admin@rytswd-get-multi-cloud-k8s-v01.iam.gserviceaccount.com \
    --role='roles/owner'

## TODO: This seems to not change anything. Check
```

## Step 3. Add credentials to GitHub secrets

```bash
# Get the Service Account's credential in JSON format.
#
# This will be used by Terraform, so that Terraform will act as the newly
# created "terraform-admin" Service Account.
$ gcloud iam service-accounts keys create ~/.config/gcloud/rytswd-get-multi-cloud-k8s-v01.json \
  --iam-account terraform-admin@rytswd-get-multi-cloud-k8s-v01.iam.gserviceaccount.com
```

```bash
# Encode the JSON string with base64.
$ cat ~/.config/gcloud/rytswd-get-multi-cloud-k8s-v01.json | base64
```

You have completed the setup, so go to GitHub repo, and add the last Base64 encoded JSON as secret.

Secret needs to be added with the following name:

- `GCP_SA_KEY`  
  This should be set to a really long randomised string, created at the last command above.

</details>

## Step 2. + Step 3. for Terraform Cloud

<details>
<summary>Expand for detailed steps</summary>

## Step 2. Set up your own login credentials for cloud services

_Add more description_

**NOTE:**
Terraform has 3 different API Tokens available. You must use User Token or Team Token.

If you use Organization Token,you'll get an error at Terraform Plan:

```
Error: Error locking state: Error acquiring the state lock: resource not found
```

This seems to be due to the permission of the Organization Token.

## Step 3. Add credentials to GitHub secrets

Go to GitHub repo, and add the above token as Secret.

Secret needs to be added with the following name:

- `TERRAFORM_CLOUD_INIT_API_TOKEN`  
  This should be set to some long string.

**_NOTE_**: _These should be replaced with another key. It will be discussed at Step 5._

</details>

## Step 4. Reconfigure Terraform to use new credentials

_to be added_

## Step 5. Remove your own login credentials

You can now safely remove all the transient credential keys you created earlier.

## Wrap Up - GitHub Secrets

After following all of the above, you should have the following Secrets in GitHub.

- `AWS_ACCESS_KEY_ID`: AWS Access Key ID
- `AWS_SECRET_ACCESS_KEY`: AWS Secret Access Key
- `GCP_SA_KEY`: GCP access key in JSON format, encoded with Base64
- `TERRAFORM_CLOUD_INIT_API_TOKEN`: API Token for Terraform Cloud, specifically for `init` folder

# Setup Rationale

_To be added_
