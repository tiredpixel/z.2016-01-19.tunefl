class Score < ActiveRecord::Base
  
  mount_uploader :lilypond, LilypondUploader
  mount_uploader :preview,  PreviewUploader
  mount_uploader :midi,     MidiUploader
  
  
  attr_accessible \
    :title,
    :composer,
    :copyright,
    :music,
    :blocked
  
  
  validates :music,
    :presence => true
  
  
  after_create :enqueue_job
  
  def enqueue_job
    Resque.enqueue(CompileScoreJob, self.id)
  end
  
  
  scope :blocked,
    where(:blocked => true)
  
  scope :unblocked,
    where(:blocked => false)
  
end

