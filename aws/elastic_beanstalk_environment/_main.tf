terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
      configuration_aliases = [ aws.default, aws.global ]
    }
  }
}

/*
NOTE:
A list of valid values for SolutionStackName could be obtained using AWS CLI using the following command:
aws elasticbeanstalk list-available-solution-stacks
*/
