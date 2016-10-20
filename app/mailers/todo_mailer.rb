class TodoMailer < ApplicationMailer
	def todays_list
		mail(to: 'anbublacky@gmail.com', subject: 'Welcome to My Awesome Site')
	end
end
