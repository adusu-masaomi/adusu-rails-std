# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

#資材マスターの定価を更新する

#require 'date'
#update_date = '2017-10-01'.to_date  #カタログの更新日とする

#日時型の場合
#require 'time'
#update_time = "2017-10-01 00:00:00 +0900"  #カタログの更新日とする
#update_time_to_time = Time.parse(update_time)

######################
#renderの初期データ用　消さない事 適宜、コメントアウトする

#ユーザーの初期データ(初回アップロード用に使用--消さない事)
User.create!(
   name: 'adusu',
   email: 'adusu-info@eos.ocn.ne.jp',
   password: 'adusu63325', 
   password_digest: '$2a$12$txtWNUkWEoNnmHkz2skkwu/8wLJpy3rp/.bgzAhAQykBhKBGVfvbC'
)

#(株)アデュース　データ移行用(社内sys→render.com)

