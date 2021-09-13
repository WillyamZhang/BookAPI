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
      		get "test_n_query", to: "books#test_n_query"
      	end
      end
      resources :authors 
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
