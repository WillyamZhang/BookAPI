class CreateTableBookCountries < ActiveRecord::Migration[6.0]
  def self.up
    create_table :book_countries do |t|
	  t.integer :book_id
	  t.integer :country_id
    end
  end
end