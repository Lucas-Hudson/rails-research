Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "orgs#index"

  get "/search", to: redirect { |p, req| req.params[:place].present? ? "/geo_search/#{req.params[:place]}/#{req.params[:filters].join("/")}" : "/filter_search/#{req.params[:filters].join("/")}"}
  get "/geo_search/:place/*filters", to: "orgs#index"
  get "/filter_search/*filters", to: "orgs#index"

  resources :orgs
end
