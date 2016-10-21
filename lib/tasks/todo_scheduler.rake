desc "This task is to send mail  daily todos"
task :todo_daily_list => :environment do
  puts "Updating feed..."
  AdminUser.all.each do |au|
  	@today_created = Todo.where(created_at: (Time.now.beginning_of_day..Time.now.end_of_day))
  	@today_completed = Todo.where(updated_at: (Time.now.beginning_of_day..Time.now.end_of_day), status: 'done')
  	TodoMailer.todays_list(@today_created, @today_completed, au).deliver!
  end
  puts "done."
end