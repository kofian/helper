if Rails.env.production?
 CarrierWave.configure do |config|
  config.fog_credentials = {
   :provider => 'AWS',
   :host => 's3.amazonaws.com',
   :endpoint => 'https://s3.amazonaws.com',
   :aws_access_key_id =>  "<%= Figaro.env.S3_ACCESS_KEY %>",
   :aws_secret_access_key => "<%= Figaro.env.S3_SECRET_KEY %>",
   path_style: true
  }
  config.fog_directory = "<%= Figaro.env.S3_BUCKET %>"
  end
end
