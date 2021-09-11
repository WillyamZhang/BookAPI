class CreateTableBookGutenbergs < ActiveRecord::Migration[6.0]
  def self.up
    create_table :book_gutenbergs do |t|
	  t.integer :book_id
      t.string :url
	  t.integer :num
    end
  end
end