Rails.application.routes.draw do
  resources :cards, only: %i[new create show update index] do
    resources :transactions, only: %i[new create index]
  end
end
