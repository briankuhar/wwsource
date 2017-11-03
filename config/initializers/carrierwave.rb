CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     Rails.application.secrets.AWS_ACCESS_KEY_ID,
    aws_secret_access_key: Rails.application.secrets.AWS_SECRET_ACCESS_KEY,
    region:                'us-east-2'
  }
  config.fog_directory  = Rails.application.secrets.S3_BUCKET
  config.fog_public     = false
end