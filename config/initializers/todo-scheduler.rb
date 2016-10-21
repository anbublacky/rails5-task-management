 require 'rufus/scheduler'
 scheduler = Rufus::Scheduler.new

 scheduler.every '1m' do

      puts "Test!"      
      system("rake todo_daily_list")	

 end