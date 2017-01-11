Rails.application.routes.draw do
  apipie

  namespace :api do
    get 'people/report_infection' => 'people#report_infection'
    get 'people/:id/properties' => 'people#properties'

    resources :people

    namespace :report do
      resources :infected, :non_infected, :people_inventory, :infected_points
    end

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end