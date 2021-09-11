class CreateTableAuthorWikipedias < ActiveRecord::Migration[6.0]
  def self.up
    create_table :author_wikipedias do |t|
	  t.integer :author_id
      t.string :url
      t.boolean :found
    end
  end
end