<h1 align="center"> Terraform Nexus </h1> <br>
<p align="center">
  <a href="https://developer.hashicorp.com/terraform/intro">
    <img alt="Terraform" title="Terraform" src="_assets/Terraform_onDark.png" width="512">
  </a>
</p>

<p align="center">
  A repository of Terraform building blocks I have used for building cloud resources.
</p>

## Cloud Providers

These are currently the cloud providers represented in this repository.

- [Amazon Web Services](./terraform-aws/README.md)
- [Microsoft Azure](./terraform-az/README.md)
- [Google Cloud Platform](./terraform-gcp/README.md)


## Organization

An important consideration is ensuring that Terraform template files are organized in proper directories, and also within the files they use a repeatable set of variables and follow best practices.

The `environment` and `infrastructure-live` directories are heavily influenced by the work of Anton Putra, whose work can be found on his [YouTube channel](https://www.youtube.com/@AntonPutra) and also in his [dedicated GitHub repo](https://github.com/antonputra/tutorials).
