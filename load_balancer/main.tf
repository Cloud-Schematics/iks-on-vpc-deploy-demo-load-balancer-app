##############################################################################
# IBM Cloud Provider
##############################################################################

provider ibm {
  ibmcloud_api_key   = var.ibmcloud_api_key
  region             = var.ibm_region
  ibmcloud_timeout   = 60
}

##############################################################################


##############################################################################
# Resource Group
##############################################################################

data ibm_resource_group resource_group {
  name = var.resource_group
}

##############################################################################


##############################################################################
# Cluster Data
##############################################################################

data ibm_container_cluster_config cluster {
  cluster_name_id   = var.cluster_name
  resource_group_id = data.ibm_resource_group.resource_group.id
  admin             = true
}

##############################################################################


##############################################################################
# Kubernetes Provider
##############################################################################

provider kubernetes {
  host                   = data.ibm_container_cluster_config.cluster.host
  client_certificate     = data.ibm_container_cluster_config.cluster.admin_certificate
  client_key             = data.ibm_container_cluster_config.cluster.admin_key
  cluster_ca_certificate = data.ibm_container_cluster_config.cluster.ca_certificate
}

##############################################################################
