require 'rails_helper'

RSpec.describe User, type: :model do
  context "test associations" do 
    subject {User.create(email: 'user_email')}
    it {should have_many :organizations}
    it {should have_many :organization_users}
    it {should have_secure_password}
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
    it {should validate_length_of(:password).is_at_least(5)}
  end 

  context "test forgot and reset password functions" do
    subject {User.create(email: 'user_email', password: 'password')}

    describe "#password_reset" do
      it "updates the password value on the user object" do
        subject.password_reset_token = 'test_token'
        subject.reset_password('new_password')
        expect(subject.password_reset_token).to eq(nil)
        expect(subject.password).to eq('new_password')
      end
    end 

    describe "#send_password_reset" do
    end

    describe "#password_token_valid?" do
      it "tests whether password token is valid by checking time within one hour" do
        subject.send_password_reset
        expect(subject.password_token_valid?).to be(true)
      end 
      it "tests whether an expired reset token will return invalid/false" do
        subject.send_password_reset
        subject.password_reset_sent_at -= 1.hour
        expect(subject.password_token_valid?).to be(false)
    end
    end
  end
end
