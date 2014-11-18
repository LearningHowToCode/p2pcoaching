class AddSkypeGmailLanguaguesToTutor < ActiveRecord::Migration
  def change
    add_column :tutors, :skype_id, :string
    add_column :tutors, :gmail_address, :string
    add_column :tutors, :languages, :array
  end
end
