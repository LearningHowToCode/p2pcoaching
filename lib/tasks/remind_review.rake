namespace :fix do
  desc 'Remind reviews'
  task lesson: :environment do
    puts 'Reminding reviews...'

    Lesson.remind_reviews

    puts 'done!'
  end
end
