Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

root to: "main#index"
get "sign_up" ,to:"registration#new"
post "sign_up" ,to:"registration#create"
get "sign_in" ,to:"session#new"
post "sign_in" ,to:"session#create"
delete "logout" , to:"session#destroy"
resources :posts
get "all_users_posts" ,to:"posts#show_all"

get 'comments/new.:id', to: 'comments#new' , as: "new_comment"
post 'comments/new.:id', to: 'comments#create'
get 'comments/show' , to:'comments#show' , as:"show_comment"
end
