Spree::Api::BaseController.class_eval do
  skip_before_action :verify_authenticity_token
end
