class CreateTableBookImages < ActiveRecord::Migration[6.0]
  def self.up
    create_table :book_images do |t|
	  t.integer :book_id
      t.string :url
    end
  end
end