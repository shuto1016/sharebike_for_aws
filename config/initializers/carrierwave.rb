require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1' #例 'ap-northeast-1'
  }

  config.fog_directory  = 'blog-miniapp'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/blog-miniapp'
end