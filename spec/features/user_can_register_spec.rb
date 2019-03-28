require 'rails_helper'

RSpec.describe 'user registration', type: :feature do
  describe 'when a user visits the site' do
    describe 'they can fill out a registration form' do
      it 'will create a new user' do
        visit '/login'
        click_on("Create an Account")

        fill_in 'user[user_name]', with: "Jalena Penaligon"
        fill_in 'user[email_address]', with: "jalena.penaligon@gmail.com"
        fill_in 'user[password]', with: "password"
        click_on('Create User')

        user = User.last

        expect(current_path).to eq(user_path(user))
        expect(page).to have_content("Jalena Penaligon")
        expect(page).to have_content("jalena.penaligon@gmail.com")
        expect(user.password).to eq("password")
      end

      it 'will not create without an email address' do
        visit new_user_path

        fill_in 'user[user_name]', with: "Jalena Penaligon"
        fill_in 'user[password]', with: "password"
        click_on('Create User')

        expect(page).to have_content("Email address can't be blank")
      end

      it 'will not let a user register more than once' do
        visit new_user_path

        fill_in 'user[user_name]', with: "Jalena Penaligon"
        fill_in 'user[email_address]', with: "jalena.penaligon@gmail.com"
        fill_in 'user[password]', with: "password"
        click_on('Create User')

        visit new_user_path

        fill_in 'user[user_name]', with: "Jalena Taylor"
        fill_in 'user[email_address]', with: "jalena.penaligon@gmail.com"
        fill_in 'user[password]', with: "password123"
        click_on('Create User')

        expect(page).to have_content("Email address has already been taken")
      end
    end
  end
end
