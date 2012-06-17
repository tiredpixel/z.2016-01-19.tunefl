class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  before_filter :set_locale
  
  
  # Sets the locale.
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  # Returns default URL options.
  # 
  # @param [Hash, nil] options the options to merge in? (FIXME)
  # @return [Hash] the default URL options
  def default_url_options(options={})
    # FIXME: options isn't used!
    {
      :locale => I18n.locale
    }
  end
  
end
