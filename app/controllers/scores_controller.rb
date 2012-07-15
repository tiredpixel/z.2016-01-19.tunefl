class ScoresController < ApplicationController
  
  before_filter :get_score, :only => :show
  
  
  # GET /:locale/scores/:id
  def show
    if @score.usable
      expires_in 1.hour, :public => true
    end
  end
  
  # POST /:locale/scores
  def create
    @score = Score.new(params[:score])
    
    if @score.save
      redirect_to @score
    else
      redirect_to root_path
    end
  end
  
  
  private
  
  # Gets the Score from the params.
  # 
  # @return [Score] the Score found
  def get_score
    @score = Score.unblocked.find(params[:id])
  end
  
end

