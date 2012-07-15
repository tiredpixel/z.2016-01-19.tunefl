require 'spec_helper'

describe AdminUser do
  
  context "Attributes" do
    it { should be_protected :id }
    
    it { should be_protected :created_at }
    
    it { should be_protected :updated_at }
    
    it { should be_accessible :email }
    
    it { should be_protected :encrypted_password }
    
    it { should be_protected :reset_password_token }
    
    it { should be_protected :reset_password_sent_at }
    
    it { should be_protected :remember_created_at }
    
    it { should be_protected :sign_in_count }
    
    it { should be_protected :current_sign_in_at }
    
    it { should be_protected :last_sign_in_at }
    
    it { should be_protected :current_sign_in_ip }
    
    it { should be_protected :last_sign_in_ip }
    
  end
  
  
  context "Defaults" do
    it { AdminUser.new.sign_in_count.should == 0 }
  end
  
end

