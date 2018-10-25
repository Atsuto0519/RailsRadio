# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
every :weekday, :at => '6:44 am' do # 1.minute 1.day 1.week 1.month 1.year is also supported
  runner "Diary.create"
  runner "system('sleep 30; ffmpeg -i https://nhkradioakr2-i.akamaihd.net/hls/live/511929/1-r2/1-r2-01.m3u8 -t 900 -movflags faststart -c copy -bsf:a aac_adtstoasc ./app/assets/audios/'+Diary.last.id.to_s+'.m4a')"
end
