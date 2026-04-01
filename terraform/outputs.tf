output "flask_url" {
  value = render_web_service.flask_app.url
}

output "adminer_url" {
  value = render_web_service.adminer.url
}
