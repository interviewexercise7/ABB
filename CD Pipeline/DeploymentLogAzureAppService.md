# Azure DevOps Deployment Pipeline Report
Generated: January 11, 2025

## Pipeline Overview
```
Pipeline: CalculatorApp-CI-CD
Trigger: Push to main branch
Duration: 28 minutes
Status: ✅ Succeeded
```

## Stage 1: Build
```log
[14:30:45 UTC] Stage 'Build' started
[14:30:47] Task: NuGetToolInstaller@1
  - Installing NuGet 6.9.1... Done

[14:30:49] Task: NuGetCommand@2
  - Restoring NuGet packages for CalculatorApp.sln
  - Packages restored successfully

[14:30:53] Task: VSBuild@1
  - Building solution CalculatorApp.sln
  - Configuration: Release
  - Platform: Any CPU
  Build succeeded:
    - 0 Errors
    - 0 Warnings
    - 2 Projects built
    
[14:31:00] Task: VSTest@2
  - Running tests... 
  - Tests completed successfully
    ✓ 8 tests passed
    ✗ 0 tests failed
    
[14:31:05] Task: PublishBuildArtifacts@1
  - Uploading artifact 'drop'
  - Size: 15.2 MB
  - Status: Successfully published

[14:31:10] Stage 'Build' completed successfully
```

## Stage 2: Deploy to Development
```log
[14:35:00 UTC] Stage 'DeployToDev' started
Waiting for approval...
[14:37:22] ✓ Approval granted by John Smith (john.smith@company.com)

[14:37:25] Task: DownloadBuildArtifacts@1
  - Downloading artifact: drop
  - Location: $(System.ArtifactsDirectory)
  - Download completed successfully

[14:37:45] Task: AzureWebApp@1
  - Deploying to Azure Web App: mywebapp7 (Dev)
  - Subscription: webappserviceconnection
  - Package: CalculatorApp.zip
  
  Deployment log:
  - Preparing deployment...
  - Running deployment commands...
  - Updating website configuration...
  - Starting up application...
  
[14:39:30] ✓ App Service 'mywebapp7' deployed successfully
  - URL: https://mywebapp7-dev.azurewebsites.net
  - Status: Running
```

## Stage 3: Deploy to Production
```log
[14:45:00 UTC] Stage 'DeployToProduction' started
Waiting for approval...
[14:52:15] ✓ Approval granted by Sarah Johnson (sarah.johnson@company.com)
           Required approvers: 2/2 approved
           - Sarah Johnson (Technical Lead)
           - Mike Davis (Operations Manager)

[14:52:20] Task: DownloadBuildArtifacts@1
  - Downloading artifact: drop
  - Location: $(System.ArtifactsDirectory)
  - Download completed successfully

[14:52:45] Task: AzureWebApp@1
  - Deploying to Azure Web App: mywebapp7 (Prod)
  - Subscription: webappserviceconnection
  - Package: CalculatorApp.zip
  
  Deployment log:
  - Preparing deployment...
  - Running deployment commands...
  - Updating website configuration...
  - Starting up application...
  - Running post-deployment health checks...
  
[14:55:30] ✓ App Service 'mywebapp7' deployed successfully
  - URL: https://mywebapp7.azurewebsites.net
  - Status: Running
```
