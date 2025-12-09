require 'sinatra'
require 'mail'

Mail.defaults do
  delivery_method :smtp, {
    address: "smtp.gmail.com",
    port: 587,
    user_name: ENV["EMAIL_USERNAME"],
    password: ENV["EMAIL_PASSWORD"],
    authentication: :plain,
    enable_starttls_auto: true
  }
end

post '/submit' do
    name = params[:name]
    email = params[:email]
    message = params[:message]

  Mail.deliver do
    to "your_email@example.com"
    from email
    subject "New form submission"
    body "Name: #{name}\nEmail: #{email}\n\nMessage:\n#{message}"
  end

  "Thank you! Your message has been sent."
end
