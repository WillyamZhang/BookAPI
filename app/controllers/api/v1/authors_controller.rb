class Api::V1::AuthorsController < ApplicationController
	# GET /api/v1/authors
  # GET /api/v1/authors.json
  def index
    #@author = Author.joins("inner join author_books b on authors.id = b.author_id
    #												inner join books c on b.book_id = c.id").select("c.id, authors.name as author_name, authors.gender, convert(varchar(10),authors.born,120) as born2, convert(varchar(10),authors.died,120) as died2, c.title as book_title")
  	#								.order("authors.name")					
  	@author = AuthorBook.includes(:author, :book).select("author_books.author_id, authors.name as author_name, authors.gender, convert(varchar(10),authors.born,120) as born2, convert(varchar(10),authors.died,120) as died2, author_books.book_id, books.title as book_title")
  									 		.order("authors.name")
  	render json: @author, status: 200
  end

  def show
  end
end
