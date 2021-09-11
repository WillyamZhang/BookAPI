class Author < ApplicationRecord
	has_many :author_books
	has_many :author_countries
	has_many :author_wikipedias
	has_many :books
end