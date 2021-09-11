class Api::V1::AuthorsController < ApplicationController
  def index
  	@author = Author.includes(author_books: :book).references(:book).select("authors.name as author_name, authors.gender, authors.born, authors.died, books.title as book_title").order("books.title asc")
  	render json: @author, status: 200
  end

  def show
  end
end
