require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY'],
      aws_secret_access_key: ENV['S3_SECRET_KEY'],
      region: ENV['S3_REGION']
    }

      case Rails.env
      when 'development'
          config.fog_directory  = ENV['S3_BUCKET']
          config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/porpos-storage'
      when 'production'
          config.fog_directory  = ENV['S3_BUCKET']
          config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/porpos-storage'
      end
  end
end