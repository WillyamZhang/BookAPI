class CreateTableAuthors < ActiveRecord::Migration[6.0]
  def self.up
    create_table :authors do |t|
      t.string :name
      t.string :gender, :limit => 5
      t.integer :n_book
	  t.string :summary
	  t.datetime :born
	  t.datetime :died
    end
  end
end