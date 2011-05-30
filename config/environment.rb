# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Booka::Application.initialize!

Booka::Application.config.middleware.use ExceptionNotifier,
                      :email_prefix => "[Booka] ",
                      :sender_address => %{"Booka errors" <errores@plataformabooka.net>},
                      :exception_recipients => %w{danigb@gmail.com}
