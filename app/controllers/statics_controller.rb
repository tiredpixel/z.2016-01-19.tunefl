# +StaticsController+ is the controller for so-called 'static' pages; that is,
# pages not directly belonging to another resource. This includes pages such as
# the homepage.
class StaticsController < ApplicationController
  
  # +GET /+
  #
  # The homepage.
  # Cached for 15 minutes.
  #
  # @return [void]
  def index
    expires_in 15.minutes, :public => true
  end
  
  # +GET /legal+
  #
  # The legal page, containing license and copyright information.
  # Cached for 1 hour.
  #
  # @return [void]
  def legal
    expires_in 1.hour, :public => true
  end
  
  # +GET /sitemap.xml+
  #
  # The sitemap, useful as generated score pages cannot otherwise be crawled.
  # Cached for 1 hour.
  #
  # @return [void]
  def sitemap
    expires_in 1.hour, :public => true
  end
  
end
