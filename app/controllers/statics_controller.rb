class StaticsController < ApplicationController
  
  # GET /
  def index
    expires_in 15.minutes, :public => true
  end
  
  # GET /legal
  def legal
    expires_in 1.hour, :public => true
  end
  
  # GET /sitemap.xml
  def sitemap
    expires_in 1.hour, :public => true
  end
end

