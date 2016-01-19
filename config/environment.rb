$stdout.sync = true if ENV['LOG_SYNC'].to_i == 1

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Tunefl::Application.initialize!
