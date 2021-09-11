class Api::V1::BooksController < ApplicationController
  def index
  	@book = Book.find(params[:id])
  	render json: @book, status: 200
  end

  def show
    @book = Book.find(params[:id])
    render json: @book, status: 200
  end 

  def by_authors
  	author = params[:author].gsub(",","','")
  	@book = Book.where("author_name in ('#{author}')")
  	render json: @book, status: 200
  end

  def by_years
  	@book = Book.where("year in (#{params[:year]})")
  	render json: @book, status: 200
  end

  def by_pages
  	min = ((params[:min].nil? || params[:min] == "") ? "0" : params[:min])
  	max = ((params[:max].nil? || params[:max] == "") ? "99999" : params[:max])
  	from = ((params[:from].nil? || params[:from] == "") ? "0" : params[:from])
  	to = ((params[:to].nil? || params[:to] == "") ? "0" : params[:to])
  	@book = Book.where("(pages <= isnull(#{min},pages) or (pages >= isnull(#{max},pages))) or (pages between isnull(#{from},pages) and isnull(#{to},pages))")
  	render json: @book, status: 200
  end

  def by_related
  	BookSimiliarBook.includes(:book).where("books.title = ?", params[:title]).references(:book).each do |a| 
		  puts "#{a.book.title} was similiar with book #{a.book_name}"
		end

  	#@book = BookSimiliarBook.includes(:book).where("books.title = ?", params[:title]).references(:book).select("book_similiar_books.book_id, book_similiar_books.book_name")
  	@book = Book.joins("left join book_similiar_books on books.id = book_similiar_books.book_id
												left join books simBookId on book_similiar_books.book_name = simBookId.title ")
  	            .where("books.title = '#{params[:title]}'").select("simBookId.id, book_similiar_books.book_name")
  	render json: @book, status: 200
  end

  def book_details
  	@book = Book.includes(:author).references(:author).select("books.title, books.author_id, authors.name as author_name, books.average_rating, books.rating_count, books.release_date").order("books.title asc")
  	render json: @book, status: 200
  end  
end
