SocialThingamajig::Application.routes.draw do

  get "/log_in" => "session#new"
  post "/log_in" => "session#create"
  delete "/log_out" => "session#destroy"

  get "/feed" => "posts#index"

  resources :users
  resources :friend_circles
  resources :posts

end
