require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:phone_number)}

    # has_secure_password validation test for password
    # validates_format_of validation test for email
    
    it {should validate_uniqueness_of(:email)}
    it {should validate_uniqueness_of(:phone_number)}
  end
end