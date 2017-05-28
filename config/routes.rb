Rails.application.routes.draw do
  
  # match '/admin', :to => "statics#admin", :as => :admin, via: [:get, :post]
  match '/city', :to => "statics#city", :as => :city, via: [:post]

  root to: 'statics#calculator'

end
