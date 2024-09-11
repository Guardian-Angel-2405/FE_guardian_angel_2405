class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :password, :phone_number

  validates_uniqueness_of :email, :phone_number

  has_secure_password #by itself tells bcrypt its going to have password and password confirmation

  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP #look into testing
end