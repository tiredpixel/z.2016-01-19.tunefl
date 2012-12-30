require 'spec_helper'

describe AdminUser do
  
  context "Instance Attributes" do
    it { should have_protected :id }
    
    it { should have_protected :created_at }
    
    it { should have_protected :updated_at }
    
    it { should have_accessible :email }
    
    it { should have_protected :encrypted_password }
    
    it { should have_protected :reset_password_token }
    
    it { should have_protected :reset_password_sent_at }
    
    it { should have_protected :remember_created_at }
    
    it { should have_protected :sign_in_count }
    
    it { should have_protected :current_sign_in_at }
    
    it { should have_protected :last_sign_in_at }
    
    it { should have_protected :current_sign_in_ip }
    
    it { should have_protected :last_sign_in_ip }
  end
  
  context "Instance Attributes Defaults" do
    it "should set default :sign_in_count to 0" do
      AdminUser.new.sign_in_count.should == 0
    end
  end
  
end
