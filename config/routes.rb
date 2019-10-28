Rails.application.routes.draw do
  get '/gossip/:id' , to: 'static#gossip_each'
  get '/home', to: 'static#home'
  post '/home', to: 'static#welcome'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get '/welcome/:first_name', to: 'static#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
