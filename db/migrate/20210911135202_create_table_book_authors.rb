class CreateTableBookAuthors < ActiveRecord::Migration[6.0]
  def self.up
    create_table :book_authors do |t|
	  t.integer :book_id
	  t.integer :author_id
    end
  end
end