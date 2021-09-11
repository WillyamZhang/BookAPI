class CreateTableBookGenres < ActiveRecord::Migration[6.0]
  def self.up
    create_table :book_genres do |t|
	  t.integer :book_id
      t.string :genre
    end
  end
end