terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 5.2.8"  # Use a compatible version
    }
  }
}

provider "heroku" {
  email   = var.heroku_email
  api_key = var.heroku_api_key
}

resource "heroku_app" "app" {
  name   = var.heroku_app_name
  region = "us"

  config_vars = {
    APP_VERSION = "0.0.3"
    BUILD_DATE  = "2024-07-12"  # Replace with the actual build date
  }
}

resource "heroku_build" "build" {
  app_id = heroku_app.app.id

  source {
    url = "https://github.com/georgehampson-b6/flaskapp_task/tree/main/app"  # Replace with your repository
  }
}

resource "heroku_formation" "web" {
  app_id     = heroku_app.app.id
  type       = "web"
  quantity   = 1
  size       = "free"
}
