Rails.application.routes.draw do
  scope 'api/v1' do
    use_doorkeeper do
      skip_controllers :applications, :authorized_applications
    end
  end

  namespace :api, as: nil, defaults: { format: :json } do
    namespace :v1, as: nil do
      devise_for :users

      resources :doctors, only: [] do
        resources :available_slots, only: %i[create] do
          get 'search', on: :collection
        end

      end

      resources :appointments
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
