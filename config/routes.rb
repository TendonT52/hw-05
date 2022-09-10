Rails.application.routes.draw do
  root "main#index"
  get "main/test"
  get "main/result"
  get 'score/list'
  post 'score/delete'
  get 'score/edit'
  get 'score/update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
