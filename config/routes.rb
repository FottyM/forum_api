Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      devise_for :users
      resources :questions do
        resources :answers
      end
    end
  end

  root 'home#index'
end
