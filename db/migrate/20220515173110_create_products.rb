class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :quantity
      t.float :weight
      t.string :city
      t.text :weather_description
      t.timestamps
    end
  end
end
