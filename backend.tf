terraform {
  cloud {
    organization = "gd-jackstraw"

    workspaces {
      name = "sa-gcp"
    }
  }
}
