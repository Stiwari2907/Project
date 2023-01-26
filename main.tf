module "log_export" {
  source                 = "./modules/log-export"
  destination_uri        = "${module.destination.destination_uri}"
  filter                 = "severity >= ERROR"
  log_sink_name          = "storage_project_logsink"
  parent_resource_id     = var.project_id
  parent_resource_type   = "project"
  unique_writer_identity = true
}

module "log_export_org" {
  source                 = "./modules/log-export"
  destination_uri        = module.destination.destination_uri
  filter                 = "resource.type = gce_instance"
  log_sink_name          = "storage_org_logsink"
  parent_resource_id     = var.parent_resource_organization
  parent_resource_type   = "organization"
  unique_writer_identity = true
}

module "log_export_folder" {
  source                 = "./modules/log-export"
  destination_uri        = module.destination.destination_uri
  filter                 = "resource.type = gce_instance"
  log_sink_name          = "folder_org_logsink"
  parent_resource_id     = var.parent_resource_folder
  parent_resource_type   = "folder"
  unique_writer_identity = true
}

module "destination" {
  source                   = "./modules/logbucket"
  project_id               = var.project_id
  name                     = "storage_example_bucket"
  log_sink_writer_identity = "${module.log_export.writer_identity}"
}