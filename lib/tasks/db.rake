# frozen_string_literal: true

require 'database_cleaner'

namespace :db do
  desc 'Bootstrap the database for the current RAILS_ENV (create, setup & seed if the database does not exist)'
  task bootstrap: :environment do
    puts 'Bootstrapping the database...'
    begin
      # Only do this if the database does not exist...
      Rake::Task['db:version'].invoke
      # rubocop:disable Style/RescueStandardError
    rescue
      # rubocop:enable Style/RescueStandardError
      Rake::Task['db:create'].invoke
      Rake::Task['db:setup'].invoke
      Rake::Task['db:seed'].invoke
    end
  end
  desc 'Clean the database for the current RAILS_ENV'
  task clean: :environment do
    puts 'Cleaning the database...'
    DatabaseCleaner.clean_with(:truncation)
  end
end
