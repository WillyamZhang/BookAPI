class CreateTableBooks < ActiveRecord::Migration[6.0]
  def self.up
    create_table :books do |t|
      t.string :content_name
	  t.string :isbn
      t.string :original_title
      t.integer :year
	  t.string :author_name
	  t.string :language_code
	  t.string :category
	  t.string :plot
	  t.string :copyright
	  t.string :title
	  t.decimal :average_rating, precision: 10, scale: 2
	  t.integer :rating_count
	  t.string :description
	  t.string :loc_class
	  t.integer :pages
	  t.string :language
	  t.string :isbn13
	  t.datetime :release_date
	  t.integer :author_id
	  t.string :cover
	  t.string :summary
	  t.boolean :content_cleaned
	  t.boolean :content_available
	  t.integer :n_authors
    end
  end
end