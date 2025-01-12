2025-01-11T10:15:32.3456789Z ##[section]Starting: Deploy to Development Environment
2025-01-11T10:15:33.1234567Z ##[section]Starting: AzureKeyVault
2025-01-11T10:15:34.7891234Z ==============================================================================
2025-01-11T10:15:34.7891234Z Task         : Azure Key Vault
2025-01-11T10:15:34.7891234Z Description  : Download Azure Key Vault secrets
2025-01-11T10:15:34.7891234Z Version      : 2.0.0
2025-01-11T10:15:34.7891234Z Author       : Microsoft Corporation
2025-01-11T10:15:34.7891234Z ==============================================================================
2025-01-11T10:15:35.1234567Z Downloading secrets from key vault: my-key-vault
2025-01-11T10:15:36.4567890Z Successfully downloaded 2 secrets from key vault
2025-01-11T10:15:36.7891234Z ##[section]Finishing: AzureKeyVault

2025-01-11T10:15:37.1234567Z ##[section]Starting: PowerShell Script
2025-01-11T10:15:37.4567890Z ==============================================================================
2025-01-11T10:15:37.4567890Z Task         : PowerShell
2025-01-11T10:15:37.4567890Z Description  : Run a PowerShell script
2025-01-11T10:15:37.4567890Z Version      : 2.0.0
2025-01-11T10:15:37.4567890Z Author       : Microsoft Corporation
2025-01-11T10:15:37.4567890Z ==============================================================================
2025-01-11T10:15:38.1234567Z Deploying to Dev environment with connection string: ***
2025-01-11T10:15:38.2345678Z Using API Key: ***
2025-01-11T10:15:38.3456789Z ##[section]Finishing: PowerShell Script

2025-01-11T10:15:39.1234567Z ##[section]Starting: Azure Web App Deploy
2025-01-11T10:15:39.4567890Z ==============================================================================
2025-01-11T10:15:39.4567890Z Task         : Azure Web App Deploy
2025-01-11T10:15:39.4567890Z Description  : Deploy an Azure Web App
2025-01-11T10:15:39.4567890Z Version      : 1.0.0
2025-01-11T10:15:39.4567890Z Author       : Microsoft Corporation
2025-01-11T10:15:39.4567890Z ==============================================================================
2025-01-11T10:15:40.1234567Z Got connection details for Azure App Service:'myapp-dev'
2025-01-11T10:15:41.2345678Z Package deployment using ZIP Deploy initiated
2025-01-11T10:15:42.3456789Z Updating app settings for web app
2025-01-11T10:15:43.4567890Z Updated app settings:
2025-01-11T10:15:43.5678901Z - ConnectionStrings:DefaultConnection: [hidden]
2025-01-11T10:15:43.6789012Z - ApiKey: [hidden]
2025-01-11T10:15:44.7891234Z Successfully deployed web package to 'myapp-dev'
2025-01-11T10:15:44.8912345Z ##[section]Finishing: Azure Web App Deploy

2025-01-11T10:15:45.1234567Z ##[section]Starting: Deploy to Production Environment
2025-01-11T10:15:46.2345678Z ##[section]Starting: AzureKeyVault
2025-01-11T10:15:47.3456789Z ==============================================================================
2025-01-11T10:15:47.3456789Z Task         : Azure Key Vault
2025-01-11T10:15:47.3456789Z Description  : Download Azure Key Vault secrets
2025-01-11T10:15:47.3456789Z Version      : 2.0.0
2025-01-11T10:15:47.3456789Z Author       : Microsoft Corporation
2025-01-11T10:15:47.3456789Z ==============================================================================
2025-01-11T10:15:48.4567890Z Downloading secrets from key vault: my-key-vault
2025-01-11T10:15:49.5678901Z Successfully downloaded 2 secrets from key vault
2025-01-11T10:15:49.6789012Z ##[section]Finishing: AzureKeyVault

2025-01-11T10:15:50.1234567Z ##[section]Starting: PowerShell Script
2025-01-11T10:15:50.2345678Z Deploying to Production environment with connection string: ***
2025-01-11T10:15:50.3456789Z Using API Key: ***
2025-01-11T10:15:50.4567890Z ##[section]Finishing: PowerShell Script

2025-01-11T10:15:51.1234567Z ##[section]Starting: Azure Web App Deploy
2025-01-11T10:15:52.2345678Z Got connection details for Azure App Service:'myapp-prod'
2025-01-11T10:15:53.3456789Z Package deployment using ZIP Deploy initiated
2025-01-11T10:15:54.4567890Z Updating app settings for web app
2025-01-11T10:15:55.5678901Z Updated app settings:
2025-01-11T10:15:55.6789012Z - ConnectionStrings:DefaultConnection: [hidden]
2025-01-11T10:15:55.7891234Z - ApiKey: [hidden]
2025-01-11T10:15:56.8912345Z Successfully deployed web package to 'myapp-prod'
2025-01-11T10:15:56.9123456Z ##[section]Finishing: Azure Web App Deploy