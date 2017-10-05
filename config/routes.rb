Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'calculator#calc'
  get '/calc', to: 'calculator#calc'
end
