Rails.application.routes.draw do
	resources :tutorials do 
		resources :ratings do 
		end
		resources :reviews do 
		end
	end
end
