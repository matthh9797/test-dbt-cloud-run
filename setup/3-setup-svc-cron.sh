#!/bin/bash

SERVICE_ACCOUNT=dbt-scheduler-sa
SERVICE_NAME=dbt-service

gcloud iam service-accounts create ${SERVICE_ACCOUNT} \
   --display-name "DBT Scheduler Service Account"

gcloud run services add-iam-policy-binding ${SERVICE_NAME} \
   --member=serviceAccount:${SERVICE_ACCOUNT}@$(gcloud config get-value project).iam.gserviceaccount.com \
   --role=roles/run.invoker \
   --platform managed