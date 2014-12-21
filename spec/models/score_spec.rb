require 'spec_helper'

describe Score do
  
  context "Instance Attributes" do
    it { should have_protected :id }
    
    it { should have_protected :created_at }
    
    it { should have_protected :updated_at }
    
    it { should have_accessible :title }
    
    it { should have_accessible :composer }
    
    it { should have_accessible :copyright }
    
    it { should have_accessible :music }
    
    it { should have_accessible :blocked }
    
    it { should have_protected :usable }
  end
  
  context "Instance Attributes Defaults" do
    it "should set default :blocked to false" do
      Score.new.blocked.should be_falsey
    end
  end
  
  context "Instance Methods Uploaders" do
    describe "#lilypond" do
      it { Score.new.lilypond.should be_an_instance_of(LilypondUploader) }
    end
    
    describe "#preview" do
      it { Score.new.preview.should be_an_instance_of(PreviewUploader) }
    end
    
    describe "#midi" do
      it { Score.new.midi.should be_an_instance_of(MidiUploader) }
    end
  end
  
  context "Instance Methods" do
    describe "#enqueue_job" do
      it "should enqueue job on Resque queue" do
        @s = FactoryGirl.create(:score)
        
        CompileScoreWorker.should_receive(:perform_async).with(@s.id)
        
        @s.enqueue_job
      end
    end
  end
  
  context "Validations" do
    before(:each) do
      FactoryGirl.create(:score)
    end
    
    describe "music" do
      it { should validate_presence_of(:music) }
    end
  end
  
  context "Class Methods Scopes" do
    describe "::unblocked,::blocked" do
      before(:each) do
        @s1 = FactoryGirl.create(:score, 
          :blocked => false
        )
        @s2 = FactoryGirl.create(:score, {
          :blocked => true
        })
      end
      
      it "should scope unblocked Scores" do
        Score.unblocked.should =~ [@s1]
      end
      
      it "should scope blocked Scores" do
        Score.blocked.should =~ [@s2]
      end
    end
    
    describe "::pending,::usable,::unusable" do
      before(:each) do
        @s1 = FactoryGirl.create(:score, 
          :usable => nil
        )
        @s2 = FactoryGirl.create(:score, {
          :usable => true
        })
        @s3 = FactoryGirl.create(:score, {
          :usable => false
        })
      end
      
      it "should scope pending Scores" do
        Score.pending.should =~ [@s1]
      end
      
      it "should scope usable Scores" do
        Score.usable.should =~ [@s2]
      end
      
      it "should scope unusable Scores" do
        Score.unusable.should =~ [@s3]
      end
    end
  end
  
end
