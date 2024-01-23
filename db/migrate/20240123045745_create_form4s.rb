class CreateForm4s < ActiveRecord::Migration[7.0]
  def change
    create_table :form4s do |t|
      t.bigint :company_id
      t.bigint :insider_id
      t.float :sum_shares, default: 0.0

      t.timestamps
    end
  end
end
