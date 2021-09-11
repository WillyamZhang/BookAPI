class AuthorWikipedia < ApplicationRecord
	self.table_name = "author_wikipedias"
	belongs_to :author
end