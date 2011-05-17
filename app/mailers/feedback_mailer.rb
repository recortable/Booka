class FeedbackMailer < ActionMailer::Base
  default :from => "Booka Feedback <info@plataformabooka.net>"

  def feedback(email, body)
    @email = email
    @content = body
    date = Time.now.strftime("%d/%m/%Y")
    mail(:to => 'danigb@gmail.com', :subject => "#{date} Feedback :: Plataformabooka.net")
  end

end
