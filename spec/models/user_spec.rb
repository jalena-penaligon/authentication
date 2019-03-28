require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_name) }
    it { should validate_presence_of(:email_address) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email_address).on(:create) }
  end

  describe 'when a user logs in' do
    describe 'with a correct email and password' do
      it 'returns the user' do
        user = User.create(user_name: "Jalena", email_address: "email@gmail.com", password: "password123")
        actual = User.authenticate("email@gmail.com", "password123")

        expect(actual).to eq(user)
      end
    end

    describe 'with an incorrect email or password' do
      it 'returns nil' do
        user = User.create(user_name: "Jalena", email_address: "email@gmail.com", password: "password123")

        actual = User.authenticate("noemail@gmail.com", "password123")
        expect(actual).to eq(nil)

        actual = User.authenticate("email@gmail.com", "password")
        expect(actual).to eq(nil)
      end
    end
  end
end
