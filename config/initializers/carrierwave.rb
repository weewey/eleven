CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider: 'Google',
      google_storage_access_key_id: Figaro.env.GOOGLE_STORAGE_ACCESS_KEY_ID,
      google_storage_secret_access_key: Figaro.env.GOOGLE_STORAGE_SECRET_ACCESS_KEY
    }
    config.fog_directory = 'eleven'
    config.fog_public = true
    config.storage = :fog
  else
    config.storage = :file
    config.asset_host = "http://localhost:#{Figaro.env.port}"
  end
end
