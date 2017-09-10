Rails.application.routes.draw do
  get 'list/index'

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
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  get 'problemsfront' => 'problems#front'
  post 'mark' => 'problems#mark', as:'mark'
  get 'list' => 'list#index'
  get 'list2' => 'list#index2'
  get 'list3' => 'list#index3'
  get 'list4' => 'list#index4'
  get 'list5' => 'list#index5'
  get 'list6' => 'list#index6'
  get 'tree' => 'list#tree'
  get 'levels' => 'levels#index'
  post '/exam_update' => 'debugs#update', as: 'exam_update'
  post '/exam_generate' => 'debugs#generate', as: 'exam_generate'
  post '/exam_destroy' => 'debugs#destroy', as: 'exam_destroy'
  get '/status' => 'debugs#status'
  get '/start/:selected_test_id' =>'problems#set', as: 'exam_start'
  get '/recommend' =>'problems#recommend'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
