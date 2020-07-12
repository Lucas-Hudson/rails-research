Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "orgs#index"

  resources :orgs, only: :index, to: redirect { |p, req|
    place = req.params[:place].present? ? "/#{req.params[:place].parameterize}" : ""
    filters = req.params[:filters].present? ? "/#{req.params[:filters]&.join("/")}" : ""
    "/search#{place}#{filters}"
  }
  resources :orgs, except: :index

  get "/search", "/search/*filters", to: "orgs#index"
end
