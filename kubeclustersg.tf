resource "aws_security_group" "Kubemaster1" {
  name        = "Kubemaster1"
  description = "setting inbound rules for kubernetes master"
  vpc_id      = "vpc-0d4bc2ebe61f0072e"

  ingress {
    description      = "Kubernetes API server"
    from_port        = 6443
    to_port          = 6443
    protocol         = "tcp"
    security_groups = ["sg-09b3e85b6d5a3015a","sg-0ecaa765f7c06e0c3"]
  }

  ingress {
    description      = "etcd server client API"
    from_port        = 2379
    to_port          = 2380
    protocol         = "tcp"
    security_groups = ["sg-09b3e85b6d5a3015a"]
  }
  ingress {
    description      = "Kubelet API"
    from_port        = 10250
    to_port          = 10250
    protocol         = "tcp"
    security_groups = ["sg-09b3e85b6d5a3015a"]
  }
  ingress {
    description      = "kube-scheduler"
    from_port        = 10259
    to_port          = 10259
    protocol         = "tcp"
    security_groups = ["sg-09b3e85b6d5a3015a"]
  }
  ingress {
    description      = "kube-controller-manager"
    from_port        = 10257
    to_port          = 10257
    protocol         = "tcp"
    security_groups = ["sg-09b3e85b6d5a3015a"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol         = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Kubemaster1"
  }
}

resource "aws_security_group" "Kubeworker1" {
  name        = "Kubeworker1"
  description = "setting inbound rules for kubernetes worker"
  vpc_id      = "vpc-0d4bc2ebe61f0072e"

  ingress {
    description      = "Kubelet API"
    from_port        = 10250
    to_port          = 10250
    protocol         = "tcp"
    security_groups = ["sg-09b3e85b6d5a3015a","sg-0ecaa765f7c06e0c3"]
  }

  ingress {
    description      = "etcd server client API"
    from_port        = 30000
    to_port          = 32767
    protocol         = "tcp"
    security_groups = ["sg-09b3e85b6d5a3015a"]
  }
  ingress {
    description      = "Kubelet API"
    from_port        = 10250
    to_port          = 10250
    protocol         = "tcp"
    security_groups = ["sg-0ecaa765f7c06e0c3"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol         = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Kubeworker1"
  }
}