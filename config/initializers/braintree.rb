Braintree::Configuration.environment = :sandbox
Braintree::Configuration.logger = Logger.new('log/braintree.log')
Braintree::Configuration.merchant_id = ENV['braintree_merchant_id']
Braintree::Configuration.public_key = ENV['braintree_public_key']
Braintree::Configuration.private_key = ENV['braintree_private_key']