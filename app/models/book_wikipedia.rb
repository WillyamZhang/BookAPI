class BookWikipedia < ApplicationRecord
	self.table_name = "book_wikipedias"
	belongs_to :book

end