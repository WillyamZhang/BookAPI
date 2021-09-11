class CreateTableBookContents < ActiveRecord::Migration[6.0]
  def self.up
    create_table :book_contents do |t|
	  t.integer :book_id
	  t.integer :author_id
	  t.string :title	  
    end
  end
end