class AddSkypeGmailToStudent < ActiveRecord::Migration
  def change
    add_column :students, :skype_id, :string
    add_column :students, :gmail_address, :string
  end
end
