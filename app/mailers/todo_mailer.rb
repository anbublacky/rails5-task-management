class TodoMailer < ApplicationMailer
	def todays_list(created_list, completed_list, admin_mail)
		@created_list = created_list
		@completed_list = completed_list
		mail(to: 'anbublacky@gmail.com', subject: 'Todos created today')
	end
end
