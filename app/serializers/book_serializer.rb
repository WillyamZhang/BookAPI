class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :average_rating, :rating_count, :pages, :release_date, :author_id, :author_name
end
