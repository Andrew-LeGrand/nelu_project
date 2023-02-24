Rails.application.routes.draw do
  resources :genres
  root to: "pages#home"
  get "/about-us", to: "pages#about_us"
  resources :tv_shows
end
