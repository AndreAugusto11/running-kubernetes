resource "kubernetes_deployment" "demo" {
  metadata {
    name = "demo"
    labels = {
      app = "demo"
    }
  }

  spec {
    replicas = 1
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
          image = "nginx:latest"
          name  = "ngnix"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "demo2" {
  metadata {
    name = "demo2"
    labels = {
      app = "demo2"
    }
  }

  spec {
    replicas = 1
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
          image = "httpd:latest"
          name  = "httpd"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "error" {
  metadata {
    name = "error"
    labels = {
      app = "error"
    }
  }

  spec {
    replicas = 1
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
          name  = "nginxdemos"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
