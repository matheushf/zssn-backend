Rails.application.routes.draw do
  apipie
  #get 'people/tryhere' => 'people#tryhere'
  # resources :people

  namespace :api do
    get 'people/report_infection' => 'people#report_infection'
    get 'people/:id/properties' => 'people#properties'

    resources :people, :report
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end