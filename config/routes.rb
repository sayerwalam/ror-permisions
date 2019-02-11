Rails.application.routes.draw do
	root 'user#index'

	# standard GET requests
	get 'user/index'

	# all other GET requests
	match '/logout' => 'user#logout', :via => :get
	match '/home' => 'user#home', :via => :get

	# all POST requests
    match '/signup' => 'user#create', :via => :post
    match '/login' => 'user#login', :via => :post


end
