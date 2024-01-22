class AddEmailToDummy < ActiveRecord::Migration[7.0]
  def change
    add_column :dummies, :email, :string
    add_index :dummies, :email, unique: true
  end
end
