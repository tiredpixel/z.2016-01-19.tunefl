class ScoresController < ApplicationController
  
  before_filter :get_score, :only => :show
  
  def show
    if @score.usable
      expires_in 1.hour, :public => true
    end
  end
  
  def create
    @score = Score.new
    
    @score.title     ||= params[:score][:title]     rescue nil
    @score.composer  ||= params[:score][:composer]  rescue nil
    @score.copyright ||= params[:score][:copyright] rescue nil
    @score.music     ||= params[:score][:music]     rescue nil
    
    if @score.save
      redirect_to @score
    else
      redirect_to root_path
    end
  end
  
  
  private
  
  def get_score
    @score = Score.unblocked.find(params[:id])
  end
  
end
