desc 'This task is to send mail  daily todos'
task :todo_daily_list => :environment do
  puts 'Updating feed...'
  date_range = (Time.now.beginning_of_day..Time.now.end_of_day)
  AdminUser.all.each do |au|
  	@today_created = Todo.where(created_at: date_range)
  	@today_completed = Todo.where(updated_at: date_range, status: 'done')
  	TodoMailer.todays_list(@today_created, @today_completed, au).deliver!
  end
  puts 'done.'
end