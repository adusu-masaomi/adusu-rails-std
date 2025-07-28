source 'https://rubygems.org'

ruby '3.1.4'

gem 'postmark-rails'

#render用
#gem 'rake' , '13.0.3'
#gem 'webpacker', github: 'rails/webpacker'

#Rails6
gem 'matrix'
gem 'puma'

gem 'rdoc', '6.1.2'
gem 'psych', '3.2.0'

gem 'browser'
#iosのタッチ判定用
gem 'touchpunch-rails'  

#add180719
#モデルのattributesも複製できる
#gem 'deep_cloneable', '~> 2.3.2'
#rails6
gem 'deep_cloneable'

#画像表示用
gem 'carrierwave'
#画像圧縮用
#gem 'rmagick', require: 'RMagick'
#上記だとcentosでエラー
gem 'rmagick', require: false
gem 'mini_magick'  #add180830

#グラフ用
gem "chartkick"

#メッセージをリッチにする
#gem 'rails-assets-sweetalert2', '~> 5.1.1', source: 'https://rails-assets.org'
#gem 'sweet-alert2-rails'

gem 'rails-sweetalert2-confirm'
gem 'rails-assets-sweetalert2', source: 'https://rails-assets.org'
#upd230511
#gem 'rails-assets-sweetalert2', source: 'http://rails-assets.org'

#group :assets do
#    gem 'bootstrap-scrolltable-rails'
#end

#明細の連番を降る
gem 'sequenced'

#cacheスピードアップ
#rails6 削除
#gem 'multi_fetch_fragments'

# geocoder
gem 'geocoder'

gem "cocoon"
gem "nested_form"

#source 'https://rails-assets.org'
#gem 'rails-assets-fontawesome'

# For PDF Generation
gem "thinreports"

#デバッグ用
group :development, :test do
  gem 'sqlite3', '~> 1.4'   #render用..
	gem 'pry-rails'  # rails console(もしくは、rails c)でirbの代わりにpryを使われる
  gem 'pry-doc'    # methodを表示
  gem 'pry-byebug' # デバッグを実施(Ruby 2.0以降で動作する)
  gem 'pry-stack_explorer' # スタックをたどれる
end

#render用 --- ひとまず保留
#group :production do
#  gem "pg", "~> 1.4"
#end

gem "font-awesome-rails"
gem "font-awesome-sass"

gem 'bootstrap-sass'
gem 'autoprefixer-rails'

gem 'composite_primary_keys'
# gem 'whenever', :require => false

#gem 'bcrypt', '~> 3.1.7'
#rails6
gem 'bcrypt'

group :development do
 gem 'meta_request'
end

gem 'kaminari'
#gem 'sprockets', '3.6.3'

gem 'sprockets', '3.6.3'

gem 'axlsx'
gem 'zip-zip'

gem "responders"
gem "ransack"

gem 'jquery-ui-rails'

#rails6 
gem 'bootstrap-datetimepicker-rails'

#gem "acts_as_list"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
#gem 'rails', '4.2.6'
#railss6
#gem 'rails', '6.0.3.6'
gem 'rails', '6.1.6'

#rails6 --ng
#gem 'psych', '~> 3.1'

#gem 'rails', '5.0.1'
# Use mysql as the database for Active Record
#gem 'mysql2', '>= 0.3.13', '< 0.5'
#gem 'pg', '0.18.4'
#gem 'pg', "~> 0.18"  #これでもOK
#gem 'pg', '0.21.0'    #これで確実？(23.5.11)
#rails6
gem 'pg'

# Use SCSS for stylesheets
#gem 'sass-rails', '~> 5.0'
gem 'sass-rails', '>= 3.2'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
#gem 'coffee-rails', '~> 4.1.0'
#rails6
gem 'coffee-rails'

# See https://github.com/rails/execjs#readme for more supported runtimes
#gem 'therubyracer', platforms: :ruby

# オートコンプできるセレクトボックス
gem 'rails4-autocomplete'

gem "jquery-turbolinks" # Turbolinksで遷移したときもjQuery.ready()を呼び出してくれる
gem "select2-rails"

#rails6
#gem 'bootstrap4-datetime-picker-rails'

#gem 'bootstrap3-datetimepicker-rails'

# 追加
gem 'rails-assets-typehead.js', source:'https://rails-assets.org'
#upd 230511
#gem 'rails-assets-typehead.js', source:'http://rails-assets.org'

# 日時を操作するためのライブラリ
gem 'momentjs-rails'
#gem 'momentjs-rails', '2.11.1',  :github => 'derekprior/momentjs-rails'

# DateTimePicker
#test del
#gem 'datetimepicker-rails', github:'zpaulovics/datetimepicker-rails', branch:'master', submodules: true
#rails6--ng
#gem 'datetimepicker-rails', git: 'https://github.com/zpaulovics/datetimepicker-rails', submodules: true

#rails6
gem 'jquery-datetimepicker-rails'

#gem 'datetimepicker-rails', git: 'git://github.com/zpaulovics/datetimepicker-rails', tag: 'v1.0.0'
# gem 'bootstrap3-datetimepicker-rails', '~> 4.17.42'

# シンプルフォーム
gem 'simple_form'

# javascript runtime
#rails6 comment out
#gem 'therubyracer'
# to use less on Rails
#rails6 del 
#gem 'less-rails' 
#rails 6 --ng
#gem 'mini_racer'


#rails 6
gem "tzinfo-data" #, platforms: %i[ mingw mswin x64_mingw jruby ]

# Bootstrap itself
gem 'twitter-bootstrap-rails' 

# JavaScriptコードを実行するためのエンジン
gem 'execjs'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
#gem 'sdoc', '~> 0.4.0', group: :doc
#rails6
gem 'sdoc'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  #gem 'web-console', '~> 2.0'
  #rails6
  gem 'web-console'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

