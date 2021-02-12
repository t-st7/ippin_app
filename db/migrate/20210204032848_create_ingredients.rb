class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.references :post,         null: false, foreign_key: true
      t.string :topping,          null: false
      t.string :gram,             null: false

      t.timestamps
    end
  end
end
