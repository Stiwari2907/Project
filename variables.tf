# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
}
# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
}
# define GCP project name
variable "gcp_project" {
  type        = string
  description = "GCP project name"
}

variable "owners_members" {
  type        = list(string)
  description = "List of users to add to the owners group"
}
variable "editors_members" {
  type        = list(string)
  description = "List of users to add to the editors group"
}

variable "project_id" {
  description = "The ID of the project in which storage bucket destination will be created."
  type        = string
}

variable "parent_resource_organization" {
  description = "The ID of the organization in which the log export will be created."
  type        = string
}

variable "parent_resource_folder" {
  description = "The ID of the folder in which the log export will be created."
  type        = string
}