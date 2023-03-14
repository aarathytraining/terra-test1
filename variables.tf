variable "tagName"{
    description = "tagname for k8 instances" 
    type = list(string)
    default =["K8-Master","K8-Worker"]
}