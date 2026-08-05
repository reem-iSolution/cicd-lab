# CI/CD Pipeline Documentation

## Trigger Conditions

The workflow runs on:
- Every push to the `main` branch.
- Every pull request.

## Pipeline Stages

1. Checkout the repository.
2. Verify the Dockerfile uses a pinned base image tag.
3. Build the Docker image.
4. Start the container.
5. Run the smoke test.
6. Log in to Docker Hub.
7. Push the image with:
   - latest
   - Git commit SHA

## Secrets Used

- DOCKERHUB_USERNAME
- DOCKERHUB_TOKEN

Only the secret names are stored in the workflow. Their values are kept securely in GitHub Secrets.

## Rollback Procedure

If a deployment fails:

```bash
kubectl rollout undo deployment/cicd-app
kubectl rollout status deployment/cicd-app
```

After rollback, verify the application:

```bash
kubectl port-forward service/cicd-app-service 8080:80
curl http://localhost:8080
```