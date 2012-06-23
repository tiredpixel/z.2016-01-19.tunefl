require 'resque/tasks'

task "resque:setup" => :environment do
  Resque.after_fork do |job|
    ActiveRecord::Base.establish_connection
  end
end

