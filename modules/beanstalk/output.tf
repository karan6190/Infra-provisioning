##Output of the designed Beanstalk

output "app_name" {
  value       = "${aws_elastic_beanstalk_application.app.name}"
  description = "Application name"
}

output "cname" {
  description = "Fully qualified DNS name for the environment."
  value       = "${aws_elastic_beanstalk_environment.application.cname}"
}
