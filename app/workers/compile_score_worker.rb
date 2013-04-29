require 'tmpdir'
require 'erb'


class LilyPondException < Exception; end


class CompileScoreWorker
  
  include Sidekiq::Worker
  
  def perform(id)
    score = Score.find(id)
    
    tmpdir = Dir.mktmpdir
    
    files = {
      :lilypond     => File.join(tmpdir, "#{id}.ly"),
      :midi         => File.join(tmpdir, "#{id}.midi"),
      :png          => File.join(tmpdir, "#{id}.png"),
      :preview_eps  => File.join(tmpdir, "#{id}.preview.eps"),
      :preview_png  => File.join(tmpdir, "#{id}.preview.png"),
    }
    
    begin
      CompileScoreWorker::generate_lilypond(score, files)
      
      CompileScoreWorker::compile_lilypond(score, files)
      
      score.usable = true
      
      score.save
    rescue Exception => e
      score.usable = false
      
      score.save
      
      raise e
    ensure
      FileUtils.remove_entry_secure tmpdir
    end
  end
  
  def self.generate_lilypond(score, files)
    lilypond_data = ERB.new(File.read(
      Rails.root.join('app', 'views', 'erb', 'lilypond.ly.erb')
    )).result(binding)
    
    File.write(files[:lilypond], lilypond_data)
    
    score.lilypond = File.open(files[:lilypond])
    
    score.save
  end
  
  def self.compile_lilypond(score, files)
    output = `lilypond -dsafe -dresolution=150 -dpreview --png --output #{File.dirname(files[:lilypond])} #{files[:lilypond]} 2>&1`
    
    raise LilyPondException, output unless $?.success?
    
    score.preview = File.open(files[:preview_png])
    
    score.midi = File.open(files[:midi])
    
    score.save
  end
  
end
