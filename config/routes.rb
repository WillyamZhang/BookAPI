Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books do
      	collection do
      		get "by_authors", to: "books#by_authors"
      		get "by_years", to: "books#by_years"
      		get "by_pages", to: "books#by_pages"
      		get "by_related", to: "books#by_related"
      		get "book_details", to: "books#book_details"
      	end
      end
      resources :authors do
      	collection do
      		get "author_details", to: "authors#author_details"
      	end
      end      
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
