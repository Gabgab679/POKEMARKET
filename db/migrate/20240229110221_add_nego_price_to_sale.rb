class AddNegoPriceToSale < ActiveRecord::Migration[7.1]
  def change
    add_column :sales, :nego_price, :float
  end
end
