# Todo Mailer
class TodoMailer < ApplicationMailer
  def todays_list(created_list, completed_list, admin_mail)
    @created_list = created_list
    @completed_list = completed_list
    mail(to: admin_mail.email, subject: 'Todos created today')
  end
end
