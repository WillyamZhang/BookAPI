# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_11_141402) do

  create_table "author_books", force: :cascade do |t|
    t.integer "author_id"
    t.integer "book_id"
  end

  create_table "author_countries", force: :cascade do |t|
    t.integer "author_id"
    t.integer "country_id"
  end

  create_table "author_wikipedias", force: :cascade do |t|
    t.integer "author_id"
    t.string "url"
    t.boolean "found"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "gender", limit: 5
    t.integer "n_book"
    t.string "summary"
    t.datetime "born"
    t.datetime "died"
  end

  create_table "book_authors", force: :cascade do |t|
    t.integer "book_id"
    t.integer "author_id"
  end

  create_table "book_classes", force: :cascade do |t|
    t.integer "book_id"
    t.string "classes"
  end

  create_table "book_contents", force: :cascade do |t|
    t.integer "book_id"
    t.integer "author_id"
    t.string "title"
  end

  create_table "book_countries", force: :cascade do |t|
    t.integer "book_id"
    t.integer "country_id"
  end

  create_table "book_genres", force: :cascade do |t|
    t.integer "book_id"
    t.string "genre"
  end

  create_table "book_goodreads", force: :cascade do |t|
    t.integer "book_id"
    t.string "url"
    t.boolean "found"
    t.integer "year"
  end

  create_table "book_gutenbergs", force: :cascade do |t|
    t.integer "book_id"
    t.string "url"
    t.integer "num"
  end

  create_table "book_image_urls", force: :cascade do |t|
    t.integer "book_id"
    t.string "url"
  end

  create_table "book_images", force: :cascade do |t|
    t.integer "book_id"
    t.string "url"
  end

  create_table "book_similiar_books", force: :cascade do |t|
    t.integer "book_id"
    t.string "book_name"
  end

  create_table "book_wikipedias", force: :cascade do |t|
    t.integer "book_id"
    t.string "url"
    t.boolean "found"
    t.integer "year"
  end

  create_table "books", force: :cascade do |t|
    t.string "content_name"
    t.string "isbn"
    t.string "original_title"
    t.integer "year"
    t.string "author_name"
    t.string "language_code"
    t.string "category"
    t.string "plot"
    t.string "copyright"
    t.string "title"
    t.decimal "average_rating", precision: 10, scale: 2
    t.integer "rating_count"
    t.string "description"
    t.string "loc_class"
    t.integer "pages"
    t.string "language"
    t.string "isbn13"
    t.datetime "release_date"
    t.integer "author_id"
    t.string "cover"
    t.string "summary"
    t.boolean "content_cleaned"
    t.boolean "content_available"
    t.integer "n_authors"
  end

end
