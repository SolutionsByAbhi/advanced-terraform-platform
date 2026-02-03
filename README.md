# Advanced  Terraform  Platform  –  Multi-Environment AWS  Blueprint

This  repository implements  an  **advanced,  production-grade  Terraform setup**  for  a  multi-environment  AWS platform:

-  `dev`,  `staging`, `prod`  environments
-  Shared  global resources  (remote  state,  IAM)
- Modular  VPC  networking,  EKS,  RDS, and  observability
-  Policy-as-code  style guardrails
-  CI/CD  with  GitHub Actions
-  Pre-commit  hooks  for Terraform  quality

The  goal is  to  demonstrate  **real-world  Terraform architecture**,  not  just  a  single `main.tf`.

---

## Key  concepts

-  **Environment isolation:**  Each  environment  (`envs/dev`,  `envs/staging`, `envs/prod`)  has  its  own  state, backend,  and  configuration.
-  **Reusable modules:**  `modules/`  contains  composable  building blocks  (network,  EKS,  RDS,  observability).
-  **Global  layer:**  `global/`  bootstraps remote  state  and  shared  IAM roles.
-  **Guardrails:**  `policies/`  holds JSON  policies  that  can  be attached  via  Terraform.
-  **Automation:** `.github/workflows`  runs  `plan`  on  PRs and  gated  `apply`  on  main.

---

##  Usage

###  1.  Bootstrap  remote state

```bash
cd  global/backend-bootstrap
terraform  init
terraform  apply
