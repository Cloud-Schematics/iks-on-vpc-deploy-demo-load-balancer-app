##############################################################################
# Account Variables
##############################################################################

variable ibmcloud_api_key {
  description = "The IBM Cloud platform API key needed to deploy IAM enabled resources"
}

variable ibm_region {
  description = "IBM region for IKS on VPC cluster"
  default     = "us-south"
}

variable resource_group {
  description = "Name of resource group to provision resources"
  default     = "default"
}

variable cluster_name {
  description = "name of IKS cluster"
}

##############################################################################


##############################################################################
# App Variables
##############################################################################

variable app_name {
  description = "Name for app in kubernetes"
  default     = "demo-app"
}

variable namespace {
  description = "Namespace to deploy application"
  default     = "default"
}

variable container_name {
  description = "Name for container in deployment"
  default     = "api-service"
}

variable app_image {
  description = "link to app image to install"
}

variable app_port {
  description = "Port for app to run"
  default     = 8080
}

variable lb_type {
  description = "IKS on VPC load balancer type. Can be public or private"
  default     = "public"
}

variable protocol {
  description = "Service protocol"
  default     = "TCP"
}

variable service_port {
  description = "Port for application"
  default     = 8080
}

##############################################################################