RSpec::Matchers.define :have_protected do |attribute|
  match do |response|
    response.class.attribute_names.include?(attribute.to_s) && !response.class.accessible_attributes.include?(attribute)
  end
  
  description { "have protected :#{attribute}" }
  
  failure_message_for_should { ":#{attribute} should be protected" }
  
  failure_message_for_should_not { ":#{attribute} should not be protected" }
end
