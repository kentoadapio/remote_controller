Rails.application.routes.draw do
  get 'remote_controller/home'

  get 'remote_controller/log'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'remote_controller#home'
end
