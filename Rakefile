#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Tunefl::Application.load_tasks

# HACK: disable db:schema:dump , which can't be used for setup owning to content
# being in migrations themselves, and which is incompatible with read-only
# mounts
Rake::Task['db:schema:dump'].clear
