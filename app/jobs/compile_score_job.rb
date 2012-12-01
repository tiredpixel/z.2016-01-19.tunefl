require 'erb'

# +LilyPondException+ is a problem with executing shell command +lilypond+.
class LilyPondException < Exception; end

# +CompileScoreJob+ processes a job from the queue, compiling +Score+ using
# shell command +lilypond+. It stores resultant LilyPond, MIDI, and preview
# files.
class CompileScoreJob
  
  @queue = :compile_score_job
  
  
  # Performs the queued job.
  #
  # @param [Integer] id ID of +Score+ to be processed.
  # @return [void]
  def self.perform(id)
    score = Score.find(id)
    
    tmpdir = Rails.root.join('tmp', 'jobs', @queue.to_s)
    
    FileUtils.mkpath(tmpdir)
    
    files = {
      :lilypond     => tmpdir.join("#{id}.ly"),
      :midi         => tmpdir.join("#{id}.midi"),
      :png          => tmpdir.join("#{id}.png"),
      :preview_eps  => tmpdir.join("#{id}.preview.eps"),
      :preview_png  => tmpdir.join("#{id}.preview.png"),
    }
    
    begin
      CompileScoreJob::generate_lilypond(score, files)
      
      CompileScoreJob::compile_lilypond(score, files)
      
      score.usable = true
      
      score.save
    rescue Exception => e
      score.usable = false
      
      score.save
      
      raise e
    ensure
      files.each { |k, v| FileUtils.rm(v) if File.exists?(v) }
    end
  end
  
  # Generates the LilyPond source file.
  #
  # @param [Score] score +Score+ to use for generation.
  # @param [Hash] files Temporary filenames to use in processing.
  # @option files [Symbol] :lilypond Filename of temporary LilyPond file.
  # @return [Boolean] Whether +Score+ save was successful.
  def self.generate_lilypond(score, files)
    lilypond_data = ERB.new(File.read(
      Rails.root.join('app', 'views', 'erb', 'lilypond.ly.erb')
    )).result(binding)
    
    File.write(files[:lilypond], lilypond_data)
    
    score.lilypond = File.open(files[:lilypond])
    
    score.save
  end
  
  # Compiles the LilyPond source file.
  #
  # @param [Score] score +Score+ to use for generation.
  # @param [Hash] files Temporary filenames to use in processing.
  # @option files [Symbol] :lilypond Filename of temporary LilyPond file.
  # @option files [Symbol] :preview_png Filename of temporary preview file.
  # @option files [Symbol] :midi Filename of temporary MIDI file.
  # @return [Boolean] Whether +Score+ save was successful.
  def self.compile_lilypond(score, files)
    output = `lilypond -dsafe -dresolution=150 -dpreview --png --output #{File.dirname(files[:lilypond])} #{files[:lilypond]} 2>&1`
    
    raise LilyPondException, output unless $?.success?
    
    score.preview = File.open(files[:preview_png])
    
    score.midi = File.open(files[:midi])
    
    score.save
  end
  
end
