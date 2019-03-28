require 'rails_helper'

RSpec.describe 'user login', type: :feature do
  before(:each) do
    @user = User.create(user_name: "Jalena Penaligon", email_address: "email@gmail.com" password: "password123")
  end

  describe 'when a user visits /login' do
    describe 'they enter valid credentials' do
      it 'logs user in' do
        visit '/login'

        fill_in 'user[email_address]' with "email@gmail.com"
        fill_in 'user[password]' with "password123"
        click_on("Submit")
      end
    end

    describe 'they enter invalid credentials' do
      it 'does not log user in' do
        visit '/login'

        fill_in 'user[email_address]' with "email@gmail.com"
        fill_in 'user[password]' with "wrongpassword"
        click_on("Submit")
      end
    end
  end
end
