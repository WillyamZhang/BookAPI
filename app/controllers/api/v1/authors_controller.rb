class Api::V1::AuthorsController < ApplicationController
	# GET /api/v1/authors
  # GET /api/v1/authors.json
  def index	
  	page = ((params[:page].nil? || params[:page] == "") ? "1" : params[:page])
  	perPage = ((params[:per_page].nil? || params[:per_page] == "") ? 10 : params[:per_page])
  	@author = AuthorBook.includes(:author, :book)
  											.select("author_books.author_id, authors.name as author_name, authors.gender, convert(varchar(10),authors.born,120) as born2, convert(varchar(10),authors.died,120) as died2, author_books.book_id, books.title as book_title")
  									 		.order("authors.name")							
  									 		.paginate(page: page, per_page: perPage)	 		
  	if @author.length > 0  		
  		render json: @author, status: 200
  	else
  		render json: {error: I18n.t("code404"),
									  status: 404
									}, status: 404
  	end 
  end

  def show
  end
end
