BlogMultitenantDynamiclayout::Application.routes.draw do
  mount Mercury::Engine => '/'

  resources :pages do
    member { post :mercury_update }
  end

  resources :blogs
  resources :articles
  # match '', to: 'blogs#show', constraints: {subdomain: /.+/}
  # or to skip www:
  match '', to: 'blogs#show', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
  root to: 'blogs#index'
end
