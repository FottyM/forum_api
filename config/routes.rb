Rails.application.routes.draw do
scope 'api' do
  scope 'vi' do
    devise_for :users
  end
end
  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :questions do
        resources :answers
      end
    end
  end

  root 'home#index'
end
