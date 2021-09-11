class CreateTableBookClasses < ActiveRecord::Migration[6.0]
  def self.up
    create_table :book_classes do |t|
	  t.integer :book_id
	  t.string :classes
    end
  end
end