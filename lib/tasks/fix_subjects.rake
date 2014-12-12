namespace :fix do
  desc 'Fix subjects duplication'
  task subjects: :environment do
    puts 'Fixing subjects...'

    Tutor.all.each do |tutor|
      if tutor.subject
        tutor.subject = tutor.subject.split(',').reject(&:blank?).map(&:strip).uniq.join(', ')
        tutor.save
        print '.'
      end
    end

    puts 'done!'
  end
end