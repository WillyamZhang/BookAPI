class CreateTableBookWikipedias < ActiveRecord::Migration[6.0]
  def self.up
    create_table :book_wikipedias do |t|
	  t.integer :book_id
      t.string :url
      t.boolean :found
	  t.integer :year
    end
  end
end