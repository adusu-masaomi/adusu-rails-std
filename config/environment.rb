# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# 時刻表示の初期値
Time::DATE_FORMATS[:start_time_1] = '%H:%M'
Time::DATE_FORMATS[:end_time_1] = '%H:%M'
Time::DATE_FORMATS[:start_time_2] = '%H:%M'
Time::DATE_FORMATS[:end_time_2] = '%H:%M'