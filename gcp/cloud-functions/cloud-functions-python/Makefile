login:
	@gcloud auth login
	@gcloud auth application-default login

create-backend:
	@gcloud storage buckets create gs://${TF_VAR_bucket_name} --location=${TF_VAR_region}

delete-backend:
	@gcloud storage rm -r gs://${TF_VAR_bucket_name}

tf-init:
	@terraform init -backend-config='bucket=${TF_VAR_bucket_name}'