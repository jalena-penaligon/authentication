require 'rails_helper'

RSpec.describe 'user logout', type: :feature do
  describe 'from the user show page' do
    describe 'a user clicks logout' do
      it 'logs the user out' do
        visit '/login'

        fill_in 'session[email_address]', with: "email@gmail.com"
        fill_in 'session[password]', with: "password123"
        click_on("Login")

        click_on("Logout")
        expect(current_path).to eq('/login')
      end
    end
  end
end
