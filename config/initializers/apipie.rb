Apipie.configure do |config|
  config.app_name                = "ZssnBackendCodeminer42"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/apidoc"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/**/*.rb"
  config.app_info = "BackEnd Test Codeminer42"
end
