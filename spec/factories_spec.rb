require 'spec_helper'

describe 'Factories' do
  
  factories = [
    :admin_user,
  ]
  
  context "Validity" do
    factories.each do |factory|
      it "#{factory} should be valid" do
        FactoryGirl.build(factory).should be_valid
      end
    end
  end
  
end
