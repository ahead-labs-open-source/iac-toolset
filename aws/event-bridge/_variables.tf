variable "description" {
    type = string
}
variable "event_pattern" {
    type = string
}
variable "name" {
    type = string
}
variable "role_inline_policy" {
    type = string
}
variable "tags" {
    type = map
    default = {}  
}
variable "target_arn" {
    type = string
}
