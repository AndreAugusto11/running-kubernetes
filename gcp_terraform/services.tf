resource "kubernetes_service" "demo" {
  metadata {
    name = "demo"
  }
  spec {
    selector = {
      app = kubernetes_deployment.demo.spec.0.template.0.metadata[0].labels.app
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "demo2" {
  metadata {
    name = "demo2"
  }
  spec {
    selector = {
      app = kubernetes_deployment.demo2.spec.0.template.0.metadata[0].labels.app
    }
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "error" {
  metadata {
    name = "error"
  }
  spec {
    selector = {
      app = kubernetes_deployment.error.spec.0.template.0.metadata[0].labels.app
    }
    port {
      port        = 9000
      target_port = 80
    }

    type = "LoadBalancer"
  }
}