class StaticsController < ApplicationController
  def index
    expires_in 15.minutes, :public => true
  end
  
  def legal
    expires_in 1.hour, :public => true
  end
  
  def sitemap
    expires_in 1.hour, :public => true
  end
end

