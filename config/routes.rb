Rails.application.routes.draw do
  # verb + path
  # http_verb '/path', to: 'controller#action', as: :prefix
  # prefix ONLY refers to the path, NOT the verb

  # CRUD routes
  # Create  -> two steps
  # form page (has a view)
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant

  # Read all -> index
  get '/restaurants', to: 'restaurants#index', as: :restaurants

  # Read one
  # :id is a placeholder for an id
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant


  # creating the instance then redirect ot the show page
  post '/restaurants', to: 'restaurants#create'

  # Update
  # form page (has a view)
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant
  # need an action to do the updating
  patch '/restaurants/:id', to: 'restaurants#update'

  #
  # Destroy
  delete '/restaurants/:id', to: 'restaurants#destroy'
end


# restaurats_path, method: :get # get
# restaurats_path, method: :post
