Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  concern :partable do
    resources :parts
  end
  resources :patterns, concerns: :partable
  resources :problems, concerns: :partable

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
