resource "kubernetes_service" "demo" {
  metadata {
    name      = "demo"
    namespace = kubernetes_namespace.test.metadata.0.name
  }
  spec {
    selector = {
      app = "demo"
    }

    port {
      port        = 80
      target_port = 80
    }
  }
}

resource "kubernetes_service" "demo2" {
  metadata {
    name      = "demo2"
    namespace = kubernetes_namespace.test.metadata.0.name
  }
  spec {
    selector = {
      app = "demo2"
    }

    port {
      port        = 8080
      target_port = 80
    }
  }
}

resource "kubernetes_service" "error" {
  metadata {
    name      = "error"
    namespace = kubernetes_namespace.test.metadata.0.name
  }
  spec {
    selector = {
      app = "error"
    }

    port {
      port        = 9000
      target_port = 80
    }
  }
}