SocialThingamajig::Application.routes.draw do

  get "/log_in" => "session#new"
  post "/log_in" => "session#create"
  delete "/log_out" => "session#destroy"

  resources :users

end
