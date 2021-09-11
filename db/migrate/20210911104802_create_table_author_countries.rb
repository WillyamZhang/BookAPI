class CreateTableAuthorCountries < ActiveRecord::Migration[6.0]
  def self.up
    create_table :author_countries do |t|
	  t.integer :author_id
	  t.integer :country_id
    end
  end
end