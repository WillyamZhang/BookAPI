class Api::V1::BooksController < ApplicationController
  def index  
  end

  # GET /api/v1/books/1
  # GET /books/1.json
  def show
  	book = Book.includes(:book_similiar_books).find_by(id: params[:id])
  	if book
  		render json: book, include:[:book_similiar_books], status: 200
  	else
  		render json: {error: "Book Not Found."}
  	end
  end 

	# POST /api/v1/books/1
  # POST /api/v1/books/1.json
  def create
  	book = Book.new(book_params)
  	if book.save
  		render json: book, status: 200
  	else
  		render json: {error: "Error creating book"}
  	end
  end

  # PATCH/PUT /api/v1/books/1
  # PATCH/PUT /api/v1/books/1.json
  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
  		render json: book, status: 200
  	else
  		render json: {error: "Error update book"}
  	end
  end

  # DELETE /api/v1/books/1
  # DELETE /api/v1/books/1.json
  def destroy
  	book = Book.find(params[:id])
  	if book.destroy
  		render json: book, status: 200
  	else
  		render json: {error: "Error delete book"}
  	end

  end

  #define method
  # GET /api/v1/books/by_authors?author=H. G. Wells
  def by_authors
  	#author = params[:author].gsub(",","','")
  	#@book = Book.where("author_name in ('#{author}')").select("books.*, convert(varchar(10), books.release_date, 120) as release_date2").order("author_name")
  	author = params[:author].split(",")
  	@book = Book.where(author_id: Author.where(name: author).pluck(:id))
  							.order("author_name")
  	render json: @book, status: 200
  end

  # GET /api/v1/books/by_years?year=H. G. Wells
  def by_years
  	year = params[:year].split(",")
  	@book = Book.where(year: year)
  							.order("year")
  	render json: @book, status: 200
  end

  # GET /api/v1/books/by_pages?min=50&max=&from=&to=
  def by_pages
  	min = ((params[:min].nil? || params[:min] == "") ? "-1" : params[:min])
  	max = ((params[:max].nil? || params[:max] == "") ? "99999" : params[:max])
  	from = ((params[:from].nil? || params[:from] == "") ? "-1" : params[:from])
  	to = ((params[:to].nil? || params[:to] == "") ? "-1" : params[:to])
  	@book = Book.where("(pages <= isnull(#{min},pages) or (pages >= isnull(#{max},pages))) or (pages between isnull(#{from},pages) and isnull(#{to},pages))")
  							.order("pages")
  	render json: @book, status: 200
  end

  # GET /api/v1/books/by_related?title=Test
  def by_related  	
  	#@book = BookSimiliarBook.includes(:book).where("books.title = ?", params[:title]).references(:book).select("book_similiar_books.book_id, book_similiar_books.book_name")
  	@book = Book.joins("left join book_similiar_books on books.id = book_similiar_books.book_id
												left join books simBookId on book_similiar_books.book_name = simBookId.title ")
  	            .where("books.title = '#{params[:title]}'")
  	            .select("simBookId.id, book_similiar_books.book_name as title, simBookId.author_name, simBookId.average_rating, simBookId.rating_count, simBookId.release_date, simBookId.year, simBookId.pages, simBookId.author_id")
  	            .order("book_similiar_books.book_name")
  	render json: @book, status: 200
  end

  # GET /api/v1/books/by_book_details
  def book_details
  	@book = Book.includes(:author)
  							.references(:author)
  							.select("books.title, books.author_id, authors.name as author_name, books.average_rating, books.rating_count, books.release_date , books.year, books.pages")
  							.order("books.title")
  	render json: @book, status: 200
  end  

  #GET /api/v1/books/test_n_query?book_id=1
  def test_n_query
  	stringArr = []
  	BookSimiliarBook.includes(:book).where(book_id: params[:book_id]).each do |a| 
		  stringArr << "#{a.book.title} was similiar with book #{a.book_name}"
		end  	
		render json: stringArr, status: 200
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
	def book_params
		params.require(:book).permit(:id,:content_name, :isbn, :original_title, :year, :author_name, :language_code, :category, :plot, :copyright, :title, :average_rating, :rating_count, :description, :loc_class, :pages, :language, :isbn13,
																:release_date, :author_id, :cover, :summary, :content_cleaned, :content_available, :n_authors, 
			book_similiar_books_attributes: [:id, :book_id, :book_name, :_destroy])
	end

end
