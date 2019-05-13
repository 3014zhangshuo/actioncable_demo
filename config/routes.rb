Rails.application.routes.draw do
  root to: 'messages#index'

  mount ActionCable.server => '/cable'
end
