resource "kubernetes_ingress" "ingress" {
  metadata {
    name = "ingress"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target": "/"
    }
  }

  spec {
    backend {
      service_name = "error"
      service_port = 9000
    }

    rule {
      http {
        path {
          backend {
            service_name = "demo"
            service_port = 80
          }

          path = "/nginx"
        }

        path {
          backend {
            service_name = "demo2"
            service_port = 8080
          }

          path = "/apache"
        }
      }
    }
  }
}
