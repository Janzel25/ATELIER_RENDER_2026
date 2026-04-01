terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = ">= 1.7.0"
    }
  }
}

provider "render" {
  api_key  = var.render_api_key
  owner_id = var.render_owner_id
}

# 🔥 Flask depuis ton repo GitHub
resource "render_web_service" "flask_app" {
  name   = "flask-render-iac"
  plan   = "free"
  region = "frankfurt"

  runtime_source = {
    repo = {
      repo_url   = var.repo_url
      branch     = "main"
      root_dir   = "backend"
    }
  }

  env_vars = {
    DATABASE_URL = {
      value = var.database_url
    }
  }
}

#  Adminer
resource "render_web_service" "adminer" {
  name   = "adminer"
  plan   = "free"
  region = "frankfurt"

  runtime_source = {
    image = {
      image_url = "adminer"
      tag       = "latest"
    }
  }
}
