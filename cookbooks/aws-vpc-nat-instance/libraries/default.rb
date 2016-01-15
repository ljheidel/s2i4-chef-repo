module AwsVpcNatInstance
  module Helper
    def disable_source_dest()
		  require 'aws-sdk'

		  aws_region = node['ec2']['placement_availability_zone'][0..-2]
                  aws_instance = node['ec2']['instance_id']
                  aws_access_key_id = node['aws-vpc-nat-instance']['access_key_id']
                  aws_secret_access_key = node['aws-vpc-nat-instance']['secret_access_key']

                   client = Aws::EC2::Client.new(region: aws_region, access_key_id: aws_access_key_id, secret_access_key: aws_secret_access_key)
                   client.modify_instance_attribute(:instance_id => aws_instance, :source_dest_check => { :value => "false" } )

    end
  end
end
