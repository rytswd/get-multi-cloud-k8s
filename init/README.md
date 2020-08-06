# Steps for Initial Setup

In order to wire up everything nicely, there is some manual orchestration effort required.

## Overview

1. Set up your own login credentials for cloud services
1. Disable Backend usage
1. Create login credential for Terraform to use
1. Re-enable Backend

## Step 0. Create your cloud service account

You need to create account for cloud services you want to use.

It should be straighforward to find the getting started document for any providers.

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
