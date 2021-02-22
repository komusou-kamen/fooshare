class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
