terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.30.0"
    }
  }

  backend "gcs" {
    bucket = "spotify-portal-public-demo-terraform"
    prefix = "${{ values.component_id }}"
  }
}

provider "google" {
  project = "spotify-portal-public-demo"
  region  = "${{ values.region }}"
}

resource "google_sql_database_instance" "${{ values.component_id }}" {
  name = "${{ values.component_id }}"

  database_version = "POSTGRES_17"
  root_password    = var.db_password

  settings {
    edition = "ENTERPRISE"
    tier    = "db-f1-micro"
  }

  deletion_protection = true
}
