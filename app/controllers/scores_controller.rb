# +ScoresController+ is the controller for the scores resource.
class ScoresController < ApplicationController
  
  before_filter :get_score, :only => :show
  
  
  # +GET /:locale/scores/:id+
  #
  # Displays a +Score+.
  # Cached for 1 hour.
  #
  # @return [void]
  def show
    if @score.usable
      expires_in 1.hour, :public => true
    end
  end
  
  # +POST /:locale/scores+
  #
  # Creates a +Score+.
  # Cached for 1 hour.
  #
  # @param params
  #   score ::
  #     title     :: Title, if any. (see {Score#title})
  #     composer  :: Composer, if any. (see {Score#composer})
  #     copyright :: Copyright notice, if any. (see {Score#copyright})
  #     music     :: Music, using LilyPond notation. (see {Score#music})
  # @return [void]
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
  
  # Gets the Score from the params.
  #
  # @return [Score] The +Score+ found.
  def get_score
    @score = Score.unblocked.find(params[:id])
  end
  
end

