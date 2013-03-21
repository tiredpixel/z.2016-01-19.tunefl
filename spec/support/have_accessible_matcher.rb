RSpec::Matchers.define :have_accessible do |attribute|
  match do |response|
    response.class.accessible_attributes.include?(attribute)
  end
  
  description { "have accessible :#{attribute}" }
  
  failure_message_for_should { ":#{attribute} should be accessible" }
  
  failure_message_for_should_not { ":#{attribute} should not be accessible" }
end
