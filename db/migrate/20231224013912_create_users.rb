class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.integer :gender, default: 0
      t.integer :age, default: 0
      t.timestamps
    end
  end
end
