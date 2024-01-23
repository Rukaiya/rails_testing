class CreateInsiders < ActiveRecord::Migration[7.0]
  def change
    create_table :insiders do |t|

      t.timestamps
    end
  end
end
