class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :book_id
      #needs another attribute
      t.text :location 
      t.timestamps
    end
  end
end
