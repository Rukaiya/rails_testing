class AddEmailToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string, null: false
    add_column :users, :stripe_customer_id, :string
  end
end