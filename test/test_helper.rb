ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/rails'

require 'support/json_service'
require 'support/serialization'

class ActiveSupport::TestCase
  include Serialization::Assertions

  fixtures :all
end

class ActionDispatch::IntegrationTest
  include JSONService::Helpers
  include Serialization::ControllerAssertions
end
