##############################################################################
# Test App Deployment
##############################################################################

resource kubernetes_deployment app_deployment {
  metadata {
    name      = var.app_name
    namespace = var.namespace

    labels = {
      app = var.app_name
    }
  }

  spec {
    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          name  = var.container_name
          image = var.app_image

          env {
            name  = "PORT"
            value = var.app_port
          }
        }
      }
    }
  }
}

##############################################################################


##############################################################################
# App Load Balancer Service
##############################################################################

resource kubernetes_service app_service {
  metadata {
    name      = "${kubernetes_deployment.app_deployment.metadata.0.name}-service"
    namespace = var.namespace

    labels = {
      app = var.app_name
    }

    annotations = {
      "service.kubernetes.io/ibm-load-balancer-cloud-provider-ip-type" = var.lb_type
    }
  }

  spec {
    port {
      protocol    = var.protocol
      port        = var.service_port
      target_port = var.service_port
    }

    selector = {
      app = var.app_name
    }

    type = "LoadBalancer"
  }
}

##############################################################################