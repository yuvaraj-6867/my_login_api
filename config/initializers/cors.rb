Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # or specify your frontend origin like 'http://localhost:3001'

    resource '*',
      headers: :any,
      methods: [:get, :post, :patch, :put, :delete, :options, :head]
  end
end
