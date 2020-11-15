Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :voices do
  resource :goodjobs, only: [:create, :destroy]
  resources :post_comments, only: [:create, :destroy]
  end
  
  root 'homes#top'
  get 'homes/about'
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  get 'users/:id/follow', to: 'users#follow', as: 'users_follow'# フォロー一覧
  get 'users/:id/follower', to: 'users#follower', as: 'users_follower'# フォロワー一覧　
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'search' => 'searchs#search'
  get 'voiceranking' => 'voices#ranking', as: 'ranking' 
end
