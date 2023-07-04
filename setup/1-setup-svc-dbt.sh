#!/bin/bash

SERVICE_ACCOUNT=dbt-sa

gcloud iam service-accounts create ${SERVICE_ACCOUNT} \
   --display-name "DBT BigQuery Service Account"

gcloud projects add-iam-policy-binding \
  $(gcloud config get-value project) \
  --member=serviceAccount:${SERVICE_ACCOUNT}@$(gcloud config get-value project).iam.gserviceaccount.com \
  --role=roles/bigquery.admin