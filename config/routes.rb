Rails.application.routes.draw do
  resources :plants
  resources :people

  root to: "plants#index"
end
