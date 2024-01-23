class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :cik, null: false
      t.string :name
      t.string :ticker
      t.text :prices
      t.text :description

      t.timestamps
    end
  end
end
