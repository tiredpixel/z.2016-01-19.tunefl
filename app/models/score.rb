# +Score+ represents a score within the application. A +Score+ is generated for
# every new engraving request. It is central to the application.
#
# @!attribute id
#   @return [Integer] ID of record.
#
# @!attribute created_at
#   @return [DateTime] When record was created.
#
# @!attribute updated_at
#   @return [DateTime] When record was updated.
#
# @!attribute title
#   @return [String, nil] Title, if any.
#
# @!attribute composer
#   @return [String, nil] Composer, if any.
#
# @!attribute copyright
#   @return [String, nil] Copyright notice, if any.
#
# @!attribute music
#   @return [String] Music, using LilyPond notation.
#
# @!attribute blocked
#   @return [Boolean] Whether blocked from being displayed.
#
# @!attribute usable
#   @return [nil, Boolean] Processing status, regarding queue.
#     +nil+   :: pending
#     +true+  :: success
#     +false+ :: failure
class Score < ActiveRecord::Base
  
  # Lilypond uploader.
  #
  # @method lilypond
  # @return [LilypondUploader]
  mount_uploader :lilypond, LilypondUploader
  
  # Preview uploader.
  #
  # @method preview
  # @return [PreviewUploader]
  mount_uploader :preview, PreviewUploader
  
  # Midi uploader.
  #
  # @method midi
  # @return [MidiUploader]
  mount_uploader :midi, MidiUploader
  
  
  attr_accessible \
    :title,
    :composer,
    :copyright,
    :music,
    :blocked
  
  
  validates :music,
    :presence => true
  
  
  after_create :enqueue_job
  
  
  # Unblocked scope.
  #
  # @method unblocked
  # @scope class
  # @return [ActiveRecord::Relation]
  scope :unblocked,
    where(:blocked => false)
  
  # Blocked scope.
  #
  # @method blocked
  # @scope class
  # @return [ActiveRecord::Relation]
  scope :blocked,
    where(:blocked => true)
  
  # Pending scope.
  #
  # @method pending
  # @scope class
  # @return [ActiveRecord::Relation]
  scope :pending,
    where(:usable => nil)
  
  # Usable scope.
  #
  # @method usable
  # @scope class
  # @return [ActiveRecord::Relation]
  scope :usable,
    where(:usable => true)
  
  # Unusable scope.
  #
  # @method unusable
  # @scope class
  # @return [ActiveRecord::Relation]
  scope :unusable,
    where(:usable => false)
  
  
  # Enqueue for processing. Triggered after create.
  #
  # @return [void]
  def enqueue_job
    Resque.enqueue(CompileScoreJob, self.id)
  end
  
end
