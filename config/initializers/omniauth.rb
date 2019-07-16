# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'c82a63c35409870390a1', 'b9364a242327e86792a6e84b3b4414b794fb806a'
end