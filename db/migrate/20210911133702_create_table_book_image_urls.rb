class CreateTableBookImageUrls < ActiveRecord::Migration[6.0]
  def self.up
    create_table :book_image_urls do |t|
	  t.integer :book_id
      t.string :url
    end
  end
end