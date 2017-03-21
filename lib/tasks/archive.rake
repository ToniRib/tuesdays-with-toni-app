namespace :archive do
  desc 'Archive any exisiting votes'
  task all_votes: :environment do
    Rails.logger.info 'Archiving all voted lesson topics!'

    SuggestedTopic.archive_all!
  end
end
