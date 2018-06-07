Rails.application.routes.draw do
  get('communities/moderator')

  root('welcome#index')
  mount Notifications::Engine => "/notifications"
  # devise_for :users
  devise_for(:users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations' })
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post('/search', to: 'welcome#search')
  get('/forum', to: 'forums#index')
  resources :communities
  post('/commentaries', to: 'commentaries#create')
  post('/favourites', to: 'favourites#create')
  delete('/favourites', to: 'favourites#delete')
  patch('/subscribe', to: 'favourites#subscribe')
  resources(:favourites)
  root(to: 'pages#index')
  resources(:posts)
  resources :commentaries do
    member do
      put('like', to: 'commentaries#vote')
    end
  end
end
