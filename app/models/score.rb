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
  
  
  scope :unblocked,
    where(:blocked => false)
  
  scope :blocked,
    where(:blocked => true)
  
  scope :pending,
    where(:usable => nil)
  
  scope :usable,
    where(:usable => true)
  
  scope :unusable,
    where(:usable => false)
  
  
  def enqueue_job
    Resque.enqueue(CompileScoreJob, self.id)
  end
  
end

