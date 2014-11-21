class AddRoutingNumberAccountNumberToTutor < ActiveRecord::Migration
  def change
    add_column :tutors, :routing_number, :string
    add_column :tutors, :account_number, :string
  end
end
