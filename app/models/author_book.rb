class AuthorBook < ApplicationRecord
	belongs_to :author, optional: true
	belongs_to :book, optional: true
end