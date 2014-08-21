require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do
  scenario 'user can register and log in' do
    register_and_login("jude")
  end
end

feature 'Auth' do
  scenario 'user can see the sign in page' do


  end
end


def register(name)
  visit '/'


  expect(page).to have_content("Register")

  click_on('Register')

  expect(page).to have_content("Welcome to Chessly!")

  expect(page).to have_button("Register")

  within('form') { expect(page).to have_content('Email') }

  within('form') { expect(page).to have_content('Username') }

  within('form') { expect(page).to have_content('Password') }

  within('form') { expect(page).to have_content('USCF (optional)') }


  # expect(page).to have_content('Username')
  fill_in 'Email', with: "#{name}@gmail.com"
  fill_in 'Username', with: "#{name}"
  fill_in 'Password', with: "#{name}"
  fill_in 'USCF (optional)', with: "1800"

  # save_and_open_page

  click_button 'Register'

  expect(page).to have_content("Thanks for registering!")


end

def login(name)
  visit '/'

  expect(page).to have_content("Welcome to Chessly!")
  within('form') { expect(page).to have_content('Email') }
  within('form') { expect(page).to have_content('Password') }

  fill_in 'Email', with: "#{name}@gmail.com"
  fill_in 'Password', with: "#{name}"

  click_button 'Log In'

  expect(page).to have_content("Hi")
  expect(page).to have_button("Logout")

end

def register_and_login(name)
  register(name)
  login(name)

end