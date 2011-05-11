# encoding: utf-8

class UserMailer < ActionMailer::Base
  default :from => "Booka <info@plataformabooka.net>"
  HOST = Rails.env.production? ? "plataformabooka.net" : "localhost:3000"
  default_url_options[:host] = HOST

  helper :users


  def invitation_email(user)
     @user = user
     @host = HOST
     @url = "http://#{@host}/invitacion/#{@user.id}/#{@user.generate_code}"
     mail(:to => user.email, :subject => 'Has sido invitadx a colaborar en Plataforma Booka')
  end

  def notification_email(user)
    @user = user
    @host = HOST
    @notifications = user.notifications.to_be_emailed
    date = Time.now.strftime("%d/%m/%Y")
    mail(:to => user.email, :subject => "#{date} Cambios en tus bookas :: Plataformabooka.net")
    @notifications.each {|n| n.mark_as_mailed }
  end

end
