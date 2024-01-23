class AddOfficerTitleToForm4 < ActiveRecord::Migration[7.0]
  def change
    add_column :form4s, :officer_title, :string
    add_column :form4s, :sum_shares_after, :float, default: 0.0
  end
end
