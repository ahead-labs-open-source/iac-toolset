variable "compute_specs" {
    type = map
    default = {
        linux_3gb_2vcpu = {
            size = "BUILD_GENERAL1_SMALL"
            container = "LINUX_CONTAINER"
        }
        linux_7gb_4vcpu = {
            size = "BUILD_GENERAL1_MEDIUM"
            container = "LINUX_CONTAINER"
        }
        linux_15gb_8vcpu = {
            size = "BUILD_GENERAL1_LARGE"
            container = "LINUX_CONTAINER"
        }
        linuxgpu_15gb_8vcpu = {
            size = "BUILD_GENERAL1_LARGE"
            container = "LINUX_GPU_CONTAINER"
        }
        linux_145gb_72vcpu = {
            size = "BUILD_GENERAL1_2XLARGE"
            container = "LINUX_CONTAINER"
        }
    }
}
variable "compute_os" {
    type = map
    default = {
        al2x64 = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
        ubuntu2004 = "aws/codebuild/standard:5.0"
    }
}
output "compute_specs" {
    value = var.compute_specs  
}
output "compute_os" {
    value = var.compute_os  
}
