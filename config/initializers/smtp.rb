config.action_mailer.delivery_method = :smtp
config.action_mailer.raise_delivery_errors = true
config.action_mailer.default_url_options = { :host => 'exitticket.herokuapp.com' }

ActionMailer::Base.smtp_settings = {
    :address        => "smtp.sendgrid.net",
    :port           => "587",
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => 'heroku.com'
}