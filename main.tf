resource "null_resource" "test" {
    provisioner "local-exec" {
    command = <<EOT
      echo "hello world"
    EOT
  }
}