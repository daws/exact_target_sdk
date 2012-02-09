require 'bundler'
Bundler.require(:default, :test)

require 'exact_target_sdk'

# clear environment variables to have clean environment
ENV['EXACT_TARGET_SDK_USERNAME'] = nil
ENV['EXACT_TARGET_SDK_PASSWORD'] = nil
