class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.integer :price
      t.string :unit
      t.string :note
      t.string :sku
      t.boolean :is_sale
      t.boolean :is_feature
      t.boolean :is_new
      t.string :file_name
      t.integer :category_id
      t.string :status
      t.boolean :deleted

      t.timestamps
    end
  end
end
