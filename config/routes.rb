Rails.application.routes.draw do
  	mount_devise_token_auth_for 'User', at: 'auth'
	
	resources :users
	
	resources :tutorials do 
		resources :reviews do 
		end
	end

	post '/tutorials/:id/upvote', to: 'tutorial_votes#upvote'
	post '/tutorials/:id/downvote', to: 'tutorial_votes#downvote'

end
