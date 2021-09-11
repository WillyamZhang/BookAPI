class CreateTableBookSimiliarBooks < ActiveRecord::Migration[6.0]
  def self.up
    create_table :book_similiar_books do |t|
	  t.integer :book_id
      t.string :book_name
    end
  end
end