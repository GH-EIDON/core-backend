Rails.application.routes.draw do

  mount CoreBackend::Engine => "/core-backend"
end
