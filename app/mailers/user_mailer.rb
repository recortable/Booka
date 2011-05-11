class UserMailer < ActionMailer::Base
  default :from => "Booka <info@plataformabooka.net>"
  HOST = Rails.env.production? ? "http://plataformabooka.net" : "http://localhost:3000"

  def invitation_email(user)
     @user = user
     @host = HOST
     @url = "#{@host}/invitacion/#{@user.id}/#{@user.generate_code}"
     mail(:to => user.email, :subject => 'Has sido invitadx a colaborar en Plataforma Booka')
  end

  def notification_email(user)
    @user = user
    @host = HOST
    mail(:to => user.email, :subject => 'Cambios en tus bookas')
  end

end
