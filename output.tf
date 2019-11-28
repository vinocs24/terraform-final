output "instance_ips" {
  value = ["${aws_instance.MyTest.*.public_ip}"]
}
