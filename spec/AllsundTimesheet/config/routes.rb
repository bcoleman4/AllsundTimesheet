# -*- encoding : utf-8 -*-
Rails.application.routes.draw do

  resources :timesheets
  resources :activities
  resources :days
  resources :workstreams
  resources :clients
  resources :employees
  resources :costs
  resources :rates
  get '/charts', to: 'application#charts'
  get '/', to: 'application#Dashboard'
end

