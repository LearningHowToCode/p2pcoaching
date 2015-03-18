== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

# Tutors Subjects Data Migration

This migration is not a schema migration. Is intended to convert subjects from a column to a join table.

For a new installation:

1. `rake db:schema:load` to make sure schema is up to date.
1. `rake db:migrate` to make sure schema is up to date.

ONLY one of these:

1. `rake db:seed` to add all seed data.
1. `rails runner db/sample_data/subjects.rb` to create Subjects from Tutor::SUBJECTS.

The next steps are for running installations and new ones:

1. `rails runner db/data_migrations/subjects_tutors.rb` to convert what is in each tutor#subject to tutor#subjects.

Notice data will be saved in join table.

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

To remind students to review tutors a scheduled task needs to be run:

`rails runner Lesson.remind_reviews`

This command can be run as frequent as desired, since Lesson will remind only once.

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
