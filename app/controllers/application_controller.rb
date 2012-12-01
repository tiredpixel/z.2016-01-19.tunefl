# +ApplicationController+ is the main controller in the application, from which
# other controllers inherit.
class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  before_filter :set_locale
  
  
  # Sets the locale.
  #
  # @return [Symbol] Locale set.
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  # Returns default URL options.
  # 
  # @param [Hash, nil] options Options to merge in. (FIXME)
  # @return [Hash] the default URL options
  def default_url_options(options={})
    # FIXME: options isn't used!
    {
      # FIXME: I18n.locale was getting confused by assets...
      :locale => I18n.default_locale
    }
  end
  
end
