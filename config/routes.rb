Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      resources :questions
    end
  end

  root 'home#index'
end
