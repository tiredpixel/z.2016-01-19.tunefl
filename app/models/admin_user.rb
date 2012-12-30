# +AdminUser+ is an administrator, who logs into the backend. Devise is used to
# provide much of the functionality.
#
# @!attribute id
#   @return [Integer] ID of record.
#
# @!attribute created_at
#   @return [DateTime] When record was created.
#
# @!attribute updated_at
#   @return [DateTime] When record was updated.
#
# @!attribute reset_password_token
#   @return [String, nil] Token for resetting password, if any.
#
# @!attribute reset_password_sent_at
#   @return [DateTime, nil] When reset password token sent, if ever.
#
# @!attribute remember_created_at
#   @return [DateTime, nil] When remember me created, if ever.
#
# @!attribute email
#   @return [String] Email address.
#
# @!attribute encrypted_password
#   @return [String] Hashed password.
#
# @!attribute sign_in_count
#   @return [Integer] How many times signed in.
#
# @!attribute current_sign_in_at
#   @return [DateTime, nil] When current signed in, if ever.
#
# @!attribute last_sign_in_at
#   @return [DateTime, nil] When previous signed in, if ever.
#
# @!attribute current_sign_in_ip
#   @return [String, nil] IP of current sign-in, if any.
#
# @!attribute last_sign_in_ip
#   @return [String, nil] IP of previous sign-in, if any.
#
# @!attribute [w] password
#   @return [String] Password.
#
# @!attribute [w] password_confirmation
#   @return [String] Password confirmation.
class AdminUser < ActiveRecord::Base
  
  devise \
    :database_authenticatable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
    #:token_authenticatable
    #:encryptable
    #:confirmable
    #:lockable
    #:timeoutable
    #:omniauthable
  
  
  attr_accessible \
    :email,
    :password,
    :password_confirmation,
    :remember_me
  
end
