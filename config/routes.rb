Rails.application.routes.draw do
  	mount_devise_token_auth_for 'User', at: 'auth'
	resources :users do 
		resources :tutorials, except: :create do 
			resources :ratings do 
			end
			resources :reviews do 
			end
		end
	end

	get 'tutorials' => 'tutorials#index', as: :tutorials
	post 'tutorials' => 'tutorials#create'

end
