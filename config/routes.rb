Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  concern :partable do
    resources :parts
  end
  resources :users do
    resources :exams do
      resources :subjects do
        resources :chapters do


        end
      end
    end

  end
  resources :patterns, concerns: :partable

  resources :problems, concerns: :partable
  get '/debugs' , to:"debugs#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
