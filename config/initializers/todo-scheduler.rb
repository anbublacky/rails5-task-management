 require 'rufus/scheduler'
 scheduler = Rufus::Scheduler.new

 scheduler.every '1d' do

      puts "Test!"      
      system("rake todo_daily_list")	

 end