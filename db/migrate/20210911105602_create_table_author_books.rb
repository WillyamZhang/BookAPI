class CreateTableAuthorBooks < ActiveRecord::Migration[6.0]
  def self.up
    create_table :author_books do |t|
	  t.integer :author_id
	  t.integer :book_id
    end
  end
end