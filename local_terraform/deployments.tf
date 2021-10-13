resource "kubernetes_deployment" "demo" {
  metadata {
    name      = "demo"
    namespace = kubernetes_namespace.test.metadata.0.name
  }
  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "demo"
      }
    }
    template {
      metadata {
        labels = {
          app = "demo"
        }
      }
      spec {
        container {
          image = "nginx"
          name  = "nginx-container"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "demo2" {
  metadata {
    name      = "demo2"
    namespace = kubernetes_namespace.test.metadata.0.name
  }
  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "demo2"
      }
    }
    template {
      metadata {
        labels = {
          app = "demo2"
        }
      }
      spec {
        container {
          image = "httpd"
          name  = "httpd-container"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "error" {
  metadata {
    name      = "error"
    namespace = kubernetes_namespace.test.metadata.0.name
  }
  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "error"
      }
    }
    template {
      metadata {
        labels = {
          app = "error"
        }
      }
      spec {
        container {
          image = "nginxdemos/hello"
          name  = "httpd-container"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}