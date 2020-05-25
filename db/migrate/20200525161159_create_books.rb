class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.text :title
      t.integer :genre_id
      t.text :description
      t.integer :munber_of_pages
      t.text :author 
      t.timestamps
    end
  end
end
