class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_fee_id, null: false, foreign_key: true
      t.integer :prefecture_from_id, null: false, foreign_key: true
      t.integer :shipping_day_id, null: false, foreign_key: true
      t.integer :price, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
