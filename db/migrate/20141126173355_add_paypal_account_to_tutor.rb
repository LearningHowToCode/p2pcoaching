class AddPaypalAccountToTutor < ActiveRecord::Migration
  def change
    add_column :tutors, :paypal_account, :string
  end
end
