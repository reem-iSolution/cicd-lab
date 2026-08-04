param(
    [string]$Tag = "latest"
)

$Image = "reemahmad11/cicd-app:$Tag"

Write-Host "Deploying $Image"

kubectl set image deployment/cicd-app cicd-app=$Image

kubectl rollout status deployment/cicd-app

Write-Host "Deployment completed successfully."