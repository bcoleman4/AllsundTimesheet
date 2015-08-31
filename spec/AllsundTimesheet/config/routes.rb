# -*- encoding : utf-8 -*-
Rails.application.routes.draw do

  resources :employees
  resources :costs
  resources :rates
  get '/charts', to: 'application#charts'
  get '/', to: 'application#Dashboard'
end

