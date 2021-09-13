class Book < ApplicationRecord
	has_many :book_authors
	has_many :book_classes
	has_many :book_countries
	has_many :book_genre
	has_many :book_goodreads
	has_many :book_gutenbergs
	has_many :book_images
	has_many :book_image_urls
	has_many :book_similiar_books, dependent: :destroy
	accepts_nested_attributes_for :book_similiar_books, :allow_destroy => true
	has_many :book_wikipedias
	has_many :book_contents
	belongs_to :author, optional: true
	has_many :author_books
end