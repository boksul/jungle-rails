require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(
      first_name: "brendan",
      last_name: "lee",
      email: "b@hotmail.com",
      password: "brendan",
      password_confirmation: "brendan"
    )
    @user.save
    @user1 = User.new(
      first_name: "brendan",
      last_name: "lee",
      email: "b@hotmail.com",
      password: "brendan",
      password_confirmation: "brendan"
    )
  end

  describe 'Validations' do
    it 'should have firstname' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'should have lastname' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it 'should not have same email' do
      expect(@user1).to_not be_valid
    end

    it 'should have at least 6 characters for password' do
      @user.password = "1"
      @user.password_confirmation = "1"
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should correctly login with correct email/password' do
      email = @user.email
      password = @user.password
      authenticate = @user.authenticate_with_credentials(email, password)
      expect(authenticate).to be true
    end

    it 'should correctly login with uppercase' do
      email = @user.email.upcase
      password = @use.password
      authenticate = @user.authenticate_with_credentials(email, password)
      expect(authenticate).to be true
    end

    it 'should correctly login with empty space in the front and the end' do
      email = "b@hotmail.com"
      password = @user.password
      authenticate = @user.authenticate_with_credentials(email, password)
      expect(authenticate).to be true
    end
  end
end
