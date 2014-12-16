Rails.application.routes.draw do
  root 'questions#index'

  resources :questions, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :answers, only: [:show, :create, :new]

  resources :questions do
    resources :answers
  end


end
