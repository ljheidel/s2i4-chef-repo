name "vpcnat"
description "Role for a bind server"
run_list "recipe[s2i4-vpcnat]"

default_attributes "aws-vpc-nat-instance" => { "access_key_id" => "AKIAJ4PH6ZCRA6S7KTTQ", "secret_access_key" => "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", "disable_source_dest_check" => "false" }
