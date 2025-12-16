# Single Node GCP GKE Cluster for Labs

This Terraform configuration creates a low-cost single-node Google Kubernetes Engine (GKE) cluster suitable for practice labs.

## Prerequisites

- Terraform 1.0 or later installed.
- Google Cloud SDK installed and authenticated:
  ```sh
  gcloud auth login
  gcloud config set project <YOUR_PROJECT_ID>
  ```
- GKE API enabled:
  ```sh
  gcloud services enable container.googleapis.com
  ```
- (Optional) Service account credentials:
  ```sh
  export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your/sa-key.json"
  ```

## Configuration Variables

| Name         | Default                     | Description                 |
|--------------|-----------------------------|-----------------------------|
| project_id   | n/a                         | GCP project ID (required)   |
| region       | us-central1                 | GCP region                  |
| zone         | us-central1-a               | GCP zone                    |
| cluster_name | lab-cluster-single-node     | GKE cluster name            |
| machine_type | e2-small                    | Node machine type           |
| node_count   | 1                           | Number of nodes (always 1)  |

## Usage

1. Initialize Terraform:
   ```sh
   terraform init
   ```
2. Preview changes:
   ```sh
   terraform plan -var="project_id=<YOUR_PROJECT_ID>"
   ```
3. Apply changes:
   ```sh
   terraform apply -var="project_id=<YOUR_PROJECT_ID>" -auto-approve
   ```
4. Configure kubectl:
   ```sh
   gcloud container clusters get-credentials $(terraform output -raw cluster_name) \
     --zone $(terraform output -raw zone) \
     --project $(terraform output -raw project_id)
   ```
5. Verify cluster:
   ```sh
   kubectl get nodes
   ```

## Usage for Practice Labs

Once the cluster is up, use standard `kubectl` commands to deploy applications, services, and perform lab exercises:

```sh
kubectl apply -f your-manifest.yaml
kubectl get pods
kubectl describe service your-service
```

## Destroying Resources

To tear down the cluster:

```sh
terraform destroy -var="project_id=<YOUR_PROJECT_ID>" -auto-approve
```
