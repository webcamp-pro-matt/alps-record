class Taxes < ActiveRecord::Migration[5.2]
  def change
  	add_column :taxes, :tax, :float
  	add_column :taxes, :tax_start_day, :datetime
  	add_column :taxes, :tax_finish_day, :datetime
  end
end
