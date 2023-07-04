require_relative 'boot'
require File.expand_path('../boot', __FILE__)  #rails4

require 'rails/all'
require 'csv'  #rails4

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Adusu
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.0
	
	config.active_record.default_timezone = :local
	config.time_zone = 'Tokyo'
	
	#モデルの日本語化ファイルを別管理にする
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
	
	config.i18n.default_locale = :ja 
  
  #rails6対応　submitが２回押せない為
  config.action_view.automatically_disable_submit_tag = false 
	# Do not swallow errors in after_commit/after_rollback callbacks.
    #config.active_record.raise_in_transactional_callbacks = true
     
    config.assets.enabled=true	
    
    config.assets.paths << "#{Rails}/vendor/assets/fonts"
    
    config.assets.precompile += %w(*.woff *.eot *.svg *.ttf jquery.tablefix.js cb-materialbtn.min.css) 
	
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
