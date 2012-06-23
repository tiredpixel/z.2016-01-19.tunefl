class ScoresController < ApplicationController
  def show
    @score = Score.unblocked.find(params[:id])
    
    if @score.usable
      expires_in 1.hour, :public => true
    end
  end
  
  def create
    @score = Score.new(params[:score])
    
    if @score.save
      redirect_to @score
    else
      redirect_to root_path
    end
  end
end

