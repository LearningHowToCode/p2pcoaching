Belluga2::Application.routes.draw do

  resources :lessons, except: [:index, :show] do
    resources :orders
  end
  resources :students, except: [:new, :create, :index]
  resources :tutors, except: [:new, :create]

  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_scope :user do
    get ':profile/sign_up', to: 'devise/registrations#new', as: 'new_registration',
        constraints: { profile: /tutor|student/ }
  end

  get 'sales', to: "orders#sales"
  get 'purchases', to: "orders#purchases"
  get 'how_it_works', to: 'pages#how_it_works'

  root "pages#home"
end
