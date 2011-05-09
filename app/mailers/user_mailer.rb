class UserMailer < ActionMailer::Base
  default :from => "Booka <info@plataformabooka.net>"
  HOST = "http://plataformabooka.net"

  def invitation_email(user)
     @user = user
     @host = HOST
     @url = "#{@host}/invitacion/#{@user.id}/#{@user.code}"
     mail(:to => user.email, :subject => 'Has sido invitado a colaborar en Oasis')
   end

end
