class User < ApplicationRecord
  validates_presence_of :email, :password_digest
  
  validates_uniqueness_of :email

  has_secure_password #by itself tells bcrypt its going to have password and password confirmation

  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP #replace with front end form field

  def self.from_omniauth(response)
    User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
      # u.username = response[:info][:name]
      u.first_name = response[:info][:first_name]
      u.last_name = response[:info][:last_name]
      u.email = response[:info][:email]
      u.password = SecureRandom.hex(15)

    end
  end
end