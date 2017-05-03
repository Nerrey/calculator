Rails.application.routes.draw do
  
  # match '/admin', :to => "statics#admin", :as => :admin, via: [:get, :post]

  root to: 'statics#calculator'

end
