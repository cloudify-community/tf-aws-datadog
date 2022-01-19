resource "aws_network_interface" "interface" {
  subnet_id       = var.subnet
  security_groups = [var.security_group]

  tags = {
    Name = var.instance_name
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.interface.id
    device_index         = 0
  }

  user_data = templatefile("${path.module}/resources/user_data.sh.tftpl", {dd_api_key = var.dd_api_key, app_name = var.app_name})

  tags = {
    Name = var.instance_name
  }
}