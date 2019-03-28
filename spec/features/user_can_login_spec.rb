require 'rails_helper'

RSpec.describe 'user login', type: :feature do
  before(:each) do
    @user = User.create(user_name: "Jalena Penaligon", email_address: "email@gmail.com", password: "password123")
  end

  describe 'when a user visits /login' do
    describe 'they enter valid credentials' do
      it 'logs user in' do
        visit '/login'

        fill_in 'session[email_address]', with: "email@gmail.com"
        fill_in 'session[password]', with: "password123"
        click_on("Login")

        expect(page).to have_content("Welcome #{@user.user_name}")
      end
    end

    describe 'they enter invalid credentials' do
      it 'does not log user in' do
        visit '/login'

        fill_in 'session[email_address]', with: "email@gmail.com"
        fill_in 'session[password]', with: "wrongpassword"
        click_on("Login")
    
        expect(page).to have_content("Invalid email/password combination")
      end
    end
  end
end
