class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :state
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
