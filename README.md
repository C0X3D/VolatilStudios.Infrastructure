# VolatilStudios.Infrastructure

## Overview
This repository provides an enterprise-ready, modular infrastructure-as-code and deployment solution using Terraform, Helm, and Azure Pipelines.

## Structure
- `terraform/` — Infrastructure modules and environments (dev, staging, prod)
- `helm/` — Helm charts and environment values for Kubernetes deployments
- `azure-pipelines/` — Reusable pipeline templates for CI/CD

## Getting Started
1. **Clone the repository**
2. **Configure environment files** in `terraform/environments/` and `helm/environments/` for your client/environment
3. **Run pipelines** in Azure DevOps, setting `ClientName` and `Environment` parameters

## Adding a New Client/Environment
- Copy and adjust the relevant files in `terraform/environments/` and `helm/environments/`
- Update pipeline parameters as needed

## Security & Networking
- All services are deployed with private endpoints and network isolation
- Secrets are managed via Kubernetes secrets and can be integrated with Azure Key Vault

## Extending
- Add new modules/charts as needed for your workloads
- Use pipeline templates for custom steps/stages

## Documentation
- See module and chart READMEs for details

---
For questions or contributions, open an issue or pull request.

