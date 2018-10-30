Rails.application.routes.draw do
	root 'material_admin#index'

	# standard GET requests
	get 'material_admin/index'

	# all other GET requests
	match '/logout' => 'material_admin#logout', :via => :get
	match '/home' => 'material_admin#home', :via => :get
	match '/home/:id' => 'messages#show', :via => :get

	# all POST requests
	match '/signup' => 'material_admin#create', :via => :post
  match '/login' => 'material_admin#login', :via => :post
  match '/home' => 'messages#index', :via => :post
  match '/home/:id' => 'messages#reply', :via => :post

  # all  PUT requests
  match '/home' => 'settings#index', :via => :put
	match '/home/auto' => 'settings#message', :via => :put
	match '/home/:id' => 'settings#update', :via => :put

end
