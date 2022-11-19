Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/articles', to: "articles#index"
  get '/articles/new', to: "articles#new"
  post '/articles', to: "articles#create"
  get '/articles/:id', to: "articles#show"
  get '/articles/:id/edit', to: "articles#edit"
  put '/articles/:id', to: "articles#update"

  # GET /articles -> index
  # GET /articles/2 -> show
  # GET /articles/2/edit -> edit
  # GET /articles/new -> new
  # POST /articles -> create
  # PUT /articles/2 -> update
  # DELETE /articles/2 -> destroy
end
