terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "helloflask" {
  metadata {
    name = "helloflask"
  }
}

resource "kubernetes_deployment" "helloflask" {
  metadata {
    name      = "helloflask"
    namespace = kubernetes_namespace.helloflask.metadata.0.name
  }
  timeouts {
    create = "30s"
    delete = "5m"
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "hello1"
      }
    }
    template {
      metadata {
        labels = {
          app = "hello1"
        }
      }
      spec {
        container {
          image = "helloflask:latest"
          image_pull_policy = "Never"
          name  = "helloflask-container"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "helloflask" {
  metadata {
    name      = "svc-helloflask"
    namespace = kubernetes_namespace.helloflask.metadata.0.name
  }
  timeouts {
    create = "60s"
  }
  spec {
    selector = {
      app = kubernetes_deployment.helloflask.spec.0.template.0.metadata.0.labels.app
    }
    type = "NodePort"
    port {
      port = 8080
      target_port = 8080
    }
  }
}

data "external" "minikube_env" {
  program = [ "/bin/bash", "-c", "./get_minikube_node_ip.sh" ]
}

output "URL" {
  value = "http://${data.external.minikube_env.result.node_ip}:${kubernetes_service.helloflask.spec[0].port[0].node_port}"
}
