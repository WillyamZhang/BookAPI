# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#authors = JSON.parse(File.read(Rails.root.join('db/authors.json')))

#authors["authors"].each do |aut|
	#author = Author.create(id: aut["id"], name: aut["name"], gender: aut["gender"], n_book: aut["n_books"], summary: aut["summary"], born: aut["born"], died: aut["died"])
	#if aut["wikipedia"]
		#AuthorWikipedia.create(author_id: aut["id"], url: aut["wikipedia"]["url"], found: aut["wikipedia"]["found"] )
	#end
	
	#if aut["countries"]
		#aut["countries"].each do |country|
			#AuthorCountry.create(author_id: aut["id"], country_id: country)
		#end	
	#end	
	#if aut["books"]
		#aut["books"].each do |book|
			#AuthorBook.create(author_id: aut["id"], book_id: book)
		#end	
	#end	
#end

books = JSON.parse(File.read(Rails.root.join('db/books.json')))
books["books"].each do |book|
	Book.create(id: book["id"], content_name: book["content_name"], isbn: book["isbn"], original_title: book["original_title"], year: book["year"], author_name: book["author_name"], language_code: book["language_code"], 
		category: book["category"], plot: book["plot"], copyright: book["copyright"], title: book["title"], average_rating: book["average_rating"], rating_count: book["rating_count"], description: book["description"], 
		loc_class: book["loc_class"], pages: book["pages"], language: book["language"], isbn13: book["isbn13"], release_date: book["release_date"], author_id: book["author"], 
		cover: book["cover"], summary: book["summary"], content_cleaned: book["content_cleaned"], content_available: book["content_available"], n_authors: book["n_authors"])

	if book["images"]
		book["images"].each do |img|
			BookImage.create(book_id: book["id"], url: img)
		end	
	end	
	if book["wikipedia"]
		BookWikipedia.create(book_id: book["id"], url: book["wikipedia"]["url"], found: book["wikipedia"]["found"], year: book["wikipedia"]["year"] )
	end
	if book["goodreads"]
		BookGoodread.create(book_id: book["id"], url: book["goodreads"]["url"], found: book["goodreads"]["found"], year: book["goodreads"]["year"] )
	end

	if book["similar_books"]
		book["similar_books"].each do |sim|		
			BookSimiliarBook.create(book_id: book["id"], book_name: sim)
		end	
	end	
	if book["gutenberg"]
		BookGutenberg.create(book_id: book["id"], url: book["gutenberg"]["url"], num: book["gutenberg"]["num"])
	end	
	if book["authors"]
		book["authors"].each do |aut|
			BookAuthor.create(book_id: book["id"], author_id: aut)
		end	
	end	

	if book["countries"]
		book["countries"].each do |country|
			BookCountry.create(book_id: book["id"], country_id: country)
		end	
	end	

	if book["classes"]
		book["classes"].each do |cla|
			BookClass.create(book_id: book["id"], classes: cla)
		end	
	end	

	if book["contents"]
		book["contents"].each do |con|
			BookContent.create(book_id: book["id"], title: con["title"], author_id: con["author"])
		end	
	end	
end