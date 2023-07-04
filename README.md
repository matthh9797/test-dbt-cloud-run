# DBT Cloud Run Deployment Template

The purpose of this repository is to have a template starting point for deploying a dbt project to cloud run in gcp. 

## Prerequisites

To run this locally you will need to have:
- A local environment with `dbt-bigquery` installed
- The gcloud sdk setup and installed 
- A billable gcp project

## Getting Started

1. Clone this repository `git clone https://github.com/matthh9797/dbt-cloud-run-template.git`
2. Update the YOUR_PROD_DATASET, YOUR_LOCATION, YOUR_PROJECT, YOUR_DEV_DATASET in `profiles.yml`
3. Update your project name in the folder, `dbt_profiles.yml` and `profiles.yml` (make sure to use `git mv <old_name> <new_name>` when updating the project folder)
4. Update region and service name in `setup/2-deploy-cr.sh`
4. Run the scripts in the `setup/` folder one by one by running `bash setup/1- ....sh` etc. Make sure to test the cloud run service by invoking it in the cloud shell.
5. Test the cloud run service by invoking it in the cloud shell then remove the example folder from models and `--example` tag from `script.sh`
6. Optionally, create a key for the dbt-sa service account and setup your dev target in profiles to connect via the key. This make things a bit more seemless in development.

## References

- Deployment Scripts: [https://github.com/meteatamel/cloudrun-tutorial/blob/master/docs/scheduled-dbt-service-bigquery.md](https://github.com/meteatamel/cloudrun-tutorial/blob/master/docs/scheduled-dbt-service-bigquery.md)
- More Background: [https://medium.com/@ivan_toriya/step-by-step-guide-to-run-dbt-in-production-with-google-cloud-platform-fb1f035f3c7b](https://medium.com/@ivan_toriya/step-by-step-guide-to-run-dbt-in-production-with-google-cloud-platform-fb1f035f3c7b)
- Local Environment Setup for DBT BigQuery [local environment setup for dbt bigquery](https://matthhblog.netlify.app/posts/dbt/local-setup/)
- Best Practice DBT Folder Structure: [https://docs.getdbt.com/guides/best-practices/how-we-structure/1-guide-overview](https://docs.getdbt.com/guides/best-practices/how-we-structure/1-guide-overview)