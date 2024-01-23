class AddSectorToCompany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :sector, :text
    add_column :companies, :industry, :text
    add_column :companies, :employees, :integer, default: 0
    add_column :companies, :market_cap, :bigint, default: 0
    add_column :companies, :percent_insiders, :float, default: 0.0
  end
end
