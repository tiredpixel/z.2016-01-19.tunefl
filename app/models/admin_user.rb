class AdminUser < ActiveRecord::Base
  
  devise \
    :database_authenticatable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
#    :token_authenticatable
#    :encryptable
#    :confirmable
#    :lockable
#    :timeoutable
#    :omniauthable
  
  
  attr_accessible \
    :email,
    :password,
    :password_confirmation,
    :remember_me
  
end

