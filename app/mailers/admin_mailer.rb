class AdminMailer < ApplicationMailer
  
  default from: 'no-reply@monsite.fr'

  def participation_email(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attendance = attendance
    @admin = Attendance.administrator 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'Un nouveau participant !') 
  end
end
