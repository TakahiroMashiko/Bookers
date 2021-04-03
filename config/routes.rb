Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :homes
  resources :books
  get 'books/:id/edit' => 'books#edit'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
