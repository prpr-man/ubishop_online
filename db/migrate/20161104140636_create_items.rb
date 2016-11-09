class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false, default: ""
      t.integer :price, null: false, default: 0
      t.text :description
      t.string :category, null: false, default: ""
      t.integer :stock, null: false, default: 0
      t.string :barcode, null: false, default: ""
      t.binary :image
      t.string :image_type

      t.timestamps null: false
    end
  end
end
