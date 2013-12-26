Tunefl::Application.routes.draw do
  
  ActiveAdmin.routes(self)
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  match '/legal',   :to => 'statics#legal', :locale => 'en'
  match '/sitemap', :to => 'statics#sitemap', :locale => 'en'
  
  scope '/:locale' do
    ActiveAdmin.routes(self)
    
    resources :scores, :only => [:show, :create]
    
    root :to => 'statics#index'
  end
  
  match '/', :to => 'statics#index', :locale => 'en'
  
end

