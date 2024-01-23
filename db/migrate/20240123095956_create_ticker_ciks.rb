class CreateTickerCiks < ActiveRecord::Migration[7.0]
  def change
    create_table :ticker_ciks do |t|
      t.string :ticker
      t.string :cik

      t.timestamps
    end
  end
end
